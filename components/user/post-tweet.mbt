/// `all_tweets` represents all tweets made by this user. Each tweet is keyed
/// by its XID which doubles as the method used to sort them chronologically
/// since XIDs naturally sort by creation timestamp. Currently, it is not
/// necessary to store the full Tweet struct, so only the contents are stored
/// in the map.
let all_tweets : Ref[Map[String, String]] = { val: {  } }

pub fn post_tweet(
  tweet_contents : String,
  tweet_xid : String
) -> SuccessOrFailureResult {
  // @log.info("post_tweet('\{tweet_xid}'): ENTER")
  // To keep the tweets sorted in newest-to-oldest
  // order, we need to create a new map with this
  // tweet at the head, then copy over the remaining
  // tweets while preserving their order.
  let new_map : Map[String, String] = Map::new(
    capacity=all_tweets.val.size() + 1,
  )
  // @log.info("post_tweet('\{tweet_xid}'): allocated new map")
  new_map.set(tweet_xid, tweet_contents) // newest first
  for k, v in all_tweets.val.iter2() {
    new_map.set(k, v)
  }
  // @log.info("post_tweet('\{tweet_xid}'): copied tweets into new map")
  all_tweets.val = new_map
  // @log.info("post_tweet('\{tweet_xid}'): replaced tweets map")
  // let total_tweets = all_tweets.val.size()
  // @log.info("post_tweet('\{tweet_xid}'): \{total_tweets} total tweets")
  Success("tweet '\{tweet_xid}' posted")
}
