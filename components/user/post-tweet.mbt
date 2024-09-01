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
  all_tweets.val.set(tweet_xid, tweet_contents)
  Success("tweet posted")
}
