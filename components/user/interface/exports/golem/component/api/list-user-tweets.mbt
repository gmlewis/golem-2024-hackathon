pub fn list_user_tweets(
  user_xid : String,
  before : String,
  limit : UInt
) -> ListTweetsResult {
  // let total_tweets = all_tweets.val.size()
  // @log.info("list_user_tweets: \{total_tweets} total tweets")
  //
  let limit = limit.to_int()
  let tweets : Array[Tweet] = Array::new(capacity=limit)
  // Note that tweets are already in newest-to-oldest order.
  for pair in all_tweets.val.iter() {
    let tweet_xid = pair.0
    let tweet_contents = pair.1
    if before != "" && tweet_xid.compare(before) >= 0 {
      continue
    }
    tweets.push({ user_xid, tweet_contents, tweet_xid })
    if tweets.length() >= limit {
      break
    }
  }
  Success({ tweets, })
}
