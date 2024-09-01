pub fn unfollow_user(
  other_user_xid : String,
  jwt : String
) -> SuccessOrFailureResult {
  all_follows.val.remove(other_user_xid)
  Success("unfollowed user \{other_user_xid}")
}
