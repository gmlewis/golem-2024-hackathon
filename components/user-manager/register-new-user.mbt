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
  @log.info("register_new_user: ENTER")
  let hash_message = "\{user_handle}-\{user_password}-\{user_xid}-\{client_id}-\{timestamp_millis}"
  match validate_hmac(hash_message, client_id, timestamp_millis, hmac_hash) {
    Ok(_) => ()
    Err(s) => return Error(s)
  }
  //
  @log.info("register_new_user: lookup_user_by_handle")
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
  @log.info("register_new_user: lookup_user_by_xid")
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
  @log.info("register_new_user: user_handle_to_xid.val.set")
  user_handle_to_xid.val.set(user_handle, user_xid)
  // Create the new user
  @log.info("register_new_user: all_users.val.set")
  // temporarily hard-code the worker URNs:
  let worker_urn = "urn:worker:c70bde8a-8824-43b5-896d-eb1be94aef6d/\{user_handle}"
  all_users.val.set(
    user_xid,
    { base64_profile_jpg: "", user_handle, user_xid, worker_urn },
  )
  let user_jwt = "" // TODO
  @log.info(
    "register_new_user: successfully created new user: handle='\{user_handle}', xid='\{user_xid}'",
  )
  @log.info("register_new_user: LEAVE")
  Success({ user_xid, user_jwt })
}
