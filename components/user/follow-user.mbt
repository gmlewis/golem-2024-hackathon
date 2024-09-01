pub fn follow_user(
  other_user_xid : String,
  other_user_worker : String
) -> SuccessOrFailureResult {
  all_follows.val.set(other_user_xid, other_user_worker)
  let total_follows = all_follows.val.size()
  @log.info("follow_user: \{total_follows} total follows")
  Success("following user \{other_user_xid}")
}
