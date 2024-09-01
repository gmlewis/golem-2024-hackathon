pub fn post_tweet(
  tweet_contents : String,
  tweet_xid : String,
  jwt : String
) -> SuccessOrFailureResult {
  let payload = match validate_jwt(jwt) {
    Ok(payload) => payload
    Err(s) => return Error(s)
  }
  //
  let user_xid = payload.sub
  let user = match all_users.val.get(user_xid) {
    Some(user) => user
    _ => return Error("user \{user_xid} not found")
  }
  //

  Success("yo")
}
