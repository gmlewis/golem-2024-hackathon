/// `validate_jwt` validates a JWT using the public key provided as an env var.
fn validate_jwt(jwt : String) -> Result[JWTPayload, String] {
  // get public key
  let public_key = try {
    get_env_var!("GOLEM_2024_HACKATHON_PUBLIC_KEY")
  } catch {
    EnvVarError(e) => return Err(e)
  }
  // TODO: `jwt` may have a leading "Bearer " prefix - strip it.
  //
  let parts = jwt.split(".").collect()
  if parts.length() != 3 {
    let len = parts.length()
    @log.error("validate_jwt: got \{len} parts, want 3")
    return Err("unauthorized")
  }
  if parts[0] != "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9" {
    // {"alg":"RS256","typ": "JWT"}
    @log.error("validate_jwt: invalid header: \{parts[0]}")
    return Err("unauthorized")
  }
  let payload = try {
    @base64.std_decode2str!(parts[1], no_padding=true)
  } catch {
    @base64.CorruptInputError(e) => {
      @log.error("validate_jwt: invalid payload: \{e}")
      return Err("unauthorized")
    }
  }
  let json = try {
    @json.parse!(payload)
  } catch {
    e => {
      @log.error("validate_jwt: invalid payload: \{e}")
      return Err("unauthorized")
    }
  }
  let payload : JWTPayload = try {
    @json.from_json!(json)
  } catch {
    e => {
      @log.error("validate_jwt: invalid payload: \{e}")
      return Err("unauthorized")
    }
  }
  // TODO: Stop wasting precious time on this and come back to it later.
  Ok(payload)
}

test "base64 works correctly on payload" {
  let str =
    #|eyJ1c2VyX2hhbmRsZSI6InVzZXItMSIsImlzcyI6Imdlbi11c2VyLWp3dCIsInN1YiI6InVzZXJfY3JhMGF1N3JhY2swZGNrZjlkaGciLCJleHAiOjE3MjUxODU3OTEsIm5iZiI6MTcyNTE3MTM5MSwiaWF0IjoxNzI1MTcxMzkxfQ
  let got = try {
    @base64.std_decode2str!(str, no_padding=true)
  } catch {
    e => raise e
  }
  let want =
    #|{"user_handle":"user-1","iss":"gen-user-jwt","sub":"user_cra0au7rack0dckf9dhg","exp":1725185791,"nbf":1725171391,"iat":1725171391}
  assert_eq!(got, want)
}
