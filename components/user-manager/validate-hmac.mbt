let time_skew_grace_period_seconds = 30L

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
  let now = @wallClock.now()
  let timestamp_seconds = timestamp_millis / 1000
  let now_diff = (timestamp_seconds.to_int64() - now.seconds.to_int64()).abs()
  if now_diff > time_skew_grace_period_seconds {
    return Err(
      "rejected timestamp: got='\{timestamp_seconds}', now=\{now}, diff='\{now_diff}'",
    )
  }
  Ok(())
}
