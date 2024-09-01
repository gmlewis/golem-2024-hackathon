let time_skew_grace_period_seconds = 30L

fn validate_hmac(
  message_to_hash : String,
  client_id : String,
  timestamp_millis : UInt64,
  hmac_hash : String
) -> Result[Unit, String] {
  // check client id
  try {
    let saved_client_id = get_env_var!("GOLEM_2024_HACKATHON_CLIENT_ID")
    if saved_client_id != client_id {
      // @log.error("bad client id: got '\{client_id}', want '\{saved_client_id}'")
      return Err("unauthorized")
    }
  } catch {
    EnvVarError(e) => return Err(e)
  }
  // get client secret
  let client_secret = try {
    get_env_var!("GOLEM_2024_HACKATHON_CLIENT_SECRET")
  } catch {
    EnvVarError(e) => return Err(e)
  }
  // check timestamp
  let now = @wallClock.now()
  let timestamp_seconds = timestamp_millis / 1000
  let now_diff = (timestamp_seconds.to_int64() - now.seconds.to_int64()).abs()
  if now_diff > time_skew_grace_period_seconds {
    // @log.error(
    //   "rejected timestamp: got='\{timestamp_seconds}', now=\{now}, diff='\{now_diff}'",
    // )
    return Err("unauthorized")
  }
  // check message
  let computed_sha256sum = @sha256.gen_hmac(
    @base64.str2bytes(message_to_hash),
    @base64.str2bytes(client_secret),
  )
  if computed_sha256sum != hmac_hash {
    // @log.error(
    //   "bad hmac_hash='\{hmac_hash}', want '\{computed_sha256sum}' for obj_name='\{message_to_hash}'",
    // )
    return Err("unauthorized")
  }
  Ok(())
}
