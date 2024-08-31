fn validate_hmac(
  hash_message : String,
  client_id : String,
  timestamp_millis : UInt64,
  hmac_hash : String
) -> Result[Unit, String] {
  // check client id
  try {
    let saved_client_id = get_env_var!("GOLEM_2024_HACKATHON_CLIENT_ID")
    if saved_client_id != client_id {
      return Err("bad client id")
    }
  } catch {
    EnvVarError(e) => return Err(e)
  }
  // check timestamp
  Ok(())
}
