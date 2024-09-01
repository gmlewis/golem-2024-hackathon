pub fn get_tweet(tweet_xid : String) -> SuccessOrFailureResult {
  let total_tweets = all_tweets.val.size()
  @log.info("get_tweet: \{total_tweets} total tweets")
  match all_tweets.val.get(tweet_xid) {
    Some(contents) => Success(contents)
    _ => Error("tweet '\{tweet_xid}' not found")
  }
}
