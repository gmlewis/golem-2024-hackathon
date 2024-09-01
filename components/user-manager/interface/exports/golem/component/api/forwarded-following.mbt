pub fn forwarded_following(_user_xid : String, jwt : String) -> FollowingResult {
  let _payload = match validate_jwt(jwt) {
    Ok(payload) => payload
    Err(s) => return Error(s)
  }
  //
  Error("todo")
}
