/// `register_new_user` registers a new user.
/// It is an HMAC-protected endpoint.
pub fn register_new_user(
  user_handle : String,
  user_password : String,
  user_xid : String,
  client_id : String,
  timestamp_millis : UInt64,
  hmac_hash : String
) -> UserAuthResult {
  let hash_message = "\{user_handle}-\{user_password}-\{user_xid}-\{client_id}-\{timestamp_millis}"
  match validate_hmac(hash_message, client_id, timestamp_millis) {
    Ok(_) => ()
    Err(s) => return Error(s)
  }
  //
  match lookup_user_by_handle(user_handle) {
    Ok(_) => return Error("user handle already exists")
    Err(_) => ()
  }
  //
  match lookup_user_by_xid(user_xid) {
    Ok(_) => return Error("user xid already exists")
    Err(_) => ()
  }
  //
}
