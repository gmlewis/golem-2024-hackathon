pub fn follow_user(
  other_user_xid : String,
  jwt : String
) -> SuccessOrFailureResult {
  all_follows.val.set(other_user_xid, "")
  Success("following user \{other_user_xid}")
}
