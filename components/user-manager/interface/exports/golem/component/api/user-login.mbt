/// `user_login` logs a new user in.
/// It is an HMAC-protected endpoint.
pub fn user_login(
  _user_handle : String,
  _user_password : String,
  _client_id : String,
  _timestamp_millis : UInt64,
  _hmac_hash : String
) -> UserAuthResult {
  Error("user_login not implemented yet")
}
