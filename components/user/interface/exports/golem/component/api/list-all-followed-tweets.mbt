pub fn list_all_followed_tweets(
  _before : String,
  _limit : UInt
) -> ListTweetsResult {
  // TODO: contact all other `user` workers that are being followed and ask for
  // their latest `limit` posts, then merge the results by tweet XID (timestamp).
  Error("list_all_followed_tweets not implemented yet")
}
