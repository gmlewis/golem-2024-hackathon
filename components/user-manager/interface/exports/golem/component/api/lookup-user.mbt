/// `user_handle_to_xid` holds a mapping from every users' handle to their XID.
let user_handle_to_xid : Ref[Map[String, String]] = { val: {  } }

/// `all_users` holds a map of every user's account info, keyed by XID.
let all_users : Ref[Map[String, UserInfo]] = { val: {  } }

fn lookup_user_by_handle(user_handle : String) -> Result[UserInfo, String] {
  match user_handle_to_xid.val.get(user_handle) {
    Some(xid) => lookup_user_by_xid(xid)
    None => Err("unknown user handle")
  }
}

fn lookup_user_by_xid(user_xid : String) -> Result[UserInfo, String] {
  match all_users.val.get(user_xid) {
    Some(user_info) => Ok(user_info)
    None => Err("unknown user xid")
  }
}
