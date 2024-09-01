/// `update_profile_picture` updates a user's profile picture.
/// It is a JWT-protected endpoint.
pub fn update_profile_picture(
  base64_profile_jpg : String,
  jwt : String
) -> SuccessOrFailureResult {
  let payload = match validate_jwt(jwt) {
    Ok(payload) => payload
    Err(s) => return Error(s)
  }
  let user_handle = payload.user_handle
  let user_info = match lookup_user_by_handle(user_handle) {
    Ok(user_info) => user_info
    Err(s) => return Error(s)
  }
  // update the profile picture
  let user_xid = user_info.user_xid
  all_users.val.set(user_xid, { base64_profile_jpg, user_handle, user_xid })
  Success("profile updated for \{user_xid}")
}
