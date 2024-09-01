pub fn unfollow_user(other_user_xid : String) -> SuccessOrFailureResult {
  all_follows.val.remove(other_user_xid)
  // let total_follows = all_follows.val.size()
  // @log.info("unfollow_user: \{total_follows} total follows")
  Success("unfollowed user \{other_user_xid}")
}
