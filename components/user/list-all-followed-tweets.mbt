pub fn list_all_followed_tweets(
  before : String,
  limit : UInt
) -> ListTweetsResult {
  // TODO: contact all other `user` workers that are being followed and ask for
  // their latest `limit` posts, then merge the results by tweet XID (timestamp).
  abort("todo")
}
