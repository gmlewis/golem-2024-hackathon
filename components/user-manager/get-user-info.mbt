/// `get_user_info` returns the info about another user.
/// It is a JWT-protected endpoint.
pub fn get_user_info(user_handle : String, jwt : String) -> GetUserInfoResult {
  match validate_jwt(jwt) {
    Ok(_) => ()
    Err(s) => return Error(s)
  }
  let user_info = match lookup_user_by_handle(user_handle) {
    Ok(user_info) => user_info
    Err(s) => return Error(s)
  }
  Success(user_info)
}
