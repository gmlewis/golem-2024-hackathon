pub fn get_tweet(tweet_xid : String, jwt : String) -> SuccessOrFailureResult {
  match all_tweets.val.get(tweet_xid) {
    Some(contents) => Success(contents)
    _ => Error("tweet not found")
  }
}
