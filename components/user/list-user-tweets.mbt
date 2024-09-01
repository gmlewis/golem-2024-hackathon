pub fn list_user_tweets(
  user_xid : String,
  before : String,
  limit : UInt
) -> ListTweetsResult {
  let limit = limit.to_int()
  let tweets : Array[Tweet] = Array::new(capacity=limit)
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
