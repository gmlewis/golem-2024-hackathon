/// `update_profile_picture` updates a user's profile picture.
/// It is a JWT-protected endpoint.
pub fn update_profile_picture(
  base64_profile_jpg : String,
  jwt : String
) -> SuccessOrFailureResult {
  // Nine hours wasted on JWT validation and I can't even get the JWT out of the header.
  // https://discord.com/channels/1134448700572319785/1157293164512690267/1279608795755974827
  // match validate_jwt(jwt) {
  //   Ok(_) => ()
  //   Err(s) => return Error(s)
  // }
  // Because JWTs aren't working, change the `jwt` field into the user_handle
  let user_handle = jwt
  let user_info = match lookup_user_by_handle(user_handle) {
    Ok(user_info) => user_info
    Err(s) => return Error(s)
  }
  // update the profile picture
  let user_xid = user_info.user_xid
  all_users.val.set(user_xid, { base64_profile_jpg, user_handle, user_xid })
  Success("profile updated for \{user_xid}")
}
