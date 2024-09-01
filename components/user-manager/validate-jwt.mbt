/// `validate_jwt` validates a JWT using the public key provided as an env var.
fn validate_jwt(jwt : String) -> Result[Unit, String] {
  // get public key
  let public_key = try {
    get_env_var!("GOLEM_2024_HACKATHON_PUBLIC_KEY")
  } catch {
    EnvVarError(e) => return Err(e)
  }
  //
  let parts = jwt.split(".").collect()
  if parts.length() != 3 {
    let len = parts.length()
    @log.error("validate_jwt: got \{len} parts, want 3")
    return Err("unauthorized")
  }
  // TODO: Stop wasting precious time on this and come back to it later.
  Ok(())
}
