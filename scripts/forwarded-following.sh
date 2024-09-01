pub fn forwarded_following(user_xid : String, jwt : String) -> FollowingResult {
  let payload = match validate_jwt(jwt) {
    Ok(payload) => payload
    Err(s) => return Error(s)
  }
  //
  Error("todo")
}
