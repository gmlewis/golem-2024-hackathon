/// `all_follows` is a map of user XIDs that this user is following.
/// Each key is the user XID and the value identifies the `user` worker.
/// This naturally de-dupes the user XIDs.
let all_follows : Ref[Map[String, String]] = { val: {  } }

pub fn following() -> FollowingResult {
  let user_xids = all_follows.val.keys().collect()
  // let total_follows = all_follows.val.size()
  // @log.info("following: \{total_follows} total follows")
  Success({ user_xids, })
}
