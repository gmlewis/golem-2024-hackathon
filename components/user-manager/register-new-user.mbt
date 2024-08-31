/// `register_new_user` registers a new user.
/// It is an HMAC-protected endpoint.
pub fn register_new_user(
  user_handle : String,
  user_password : String,
  client_id : String,
  hmac_hash : String
) -> UserAuthResult {
  let hash_message = "\{user_handle}-\{user_password}-\{client_id}"

}
