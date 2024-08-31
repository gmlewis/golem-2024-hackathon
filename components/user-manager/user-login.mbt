/// `user_login` logs a new user in.
/// It is an HMAC-protected endpoint.
pub fn user_login(
  user_handle : String,
  user_password : String,
  client_id : String,
  timestamp_millis : UInt64,
  hmac_hash : String
) -> UserAuthResult {
  abort("todo")
}
