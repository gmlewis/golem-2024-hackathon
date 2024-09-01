pub fn follow_user(
  other_user_xid : String,
  other_user_worker : String,
  jwt : String
) -> SuccessOrFailureResult {
  all_follows.val.set(other_user_xid, other_user_worker)
  Success("following user \{other_user_xid}")
}
