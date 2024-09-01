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
  match validate_hmac(hash_message, client_id, timestamp_millis, hmac_hash) {
    Ok(_) => ()
    Err(s) => return Error(s)
  }
  //
  match lookup_user_by_handle(user_handle) {
    Ok(_) => {
      @log.error(
        "register_new_user: user handle '\{user_handle}' already exists",
      )
      return Error("user handle already exists")
    }
    Err(_) => ()
  }
  //
  match lookup_user_by_xid(user_xid) {
    Ok(_) => {
      @log.error("register_new_user: user xid '\{user_xid}' already exists")
      return Error("user xid already exists")
    }
    Err(_) => ()
  }
  // TODO: Create a new `user` worker to handle all tweets and follows for this user.
  //
  // Add the handle to the lookup map
  user_handle_to_xid.val.set(user_handle, user_xid)
  // Create the new user
  all_users.val.set(user_xid, { base64_profile_jpg: "", user_handle, user_xid })
  let user_jwt = "" // TODO
  @log.info(
    "register_new_user: successfully created new user: handle='\{user_handle}', xid='\{user_xid}'",
  )
  Success({ user_xid, user_jwt })
}
