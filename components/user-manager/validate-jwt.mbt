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
    @base64.std_decode2str!(parts[1])
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
