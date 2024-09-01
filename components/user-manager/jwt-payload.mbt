pub struct JWTPayload {
  user_handle : String
  iss : String
  sub : String
  exp : Int
  nbf : Int
  iat : Int
} derive(Show, Eq, ToJson)

pub fn JWTPayload::new() -> JWTPayload {
  { user_handle: "", iss: "", sub: "", exp: 0, nbf: 0, iat: 0 }
}

pub impl @json.FromJson for JWTPayload with from_json(json, path) {
  let json = match json.as_object() {
    Some(json) => json
    _ =>
      raise @json.JsonDecodeError(
        (path, "JWTPayload::from_json: expected object"),
      )
  }
  let user_handle : String = match json.get("user_handle") {
    Some(String(user_handle)) => user_handle
    _ =>
      raise @json.JsonDecodeError(
        (path, "JWTPayload::from_json:user_handle: expected String"),
      )
  }
  let iss : String = match json.get("iss") {
    Some(String(iss)) => iss
    _ =>
      raise @json.JsonDecodeError(
        (path, "JWTPayload::from_json:iss: expected String"),
      )
  }
  let sub : String = match json.get("sub") {
    Some(String(sub)) => sub
    _ =>
      raise @json.JsonDecodeError(
        (path, "JWTPayload::from_json:sub: expected String"),
      )
  }
  let exp : Int = match json.get("exp") {
    Some(Number(exp)) => exp.to_int()
    _ =>
      raise @json.JsonDecodeError(
        (path, "JWTPayload::from_json:exp expected Int"),
      )
  }
  let nbf : Int = match json.get("nbf") {
    Some(Number(nbf)) => nbf.to_int()
    _ =>
      raise @json.JsonDecodeError(
        (path, "JWTPayload::from_json:nbf expected Int"),
      )
  }
  let iat : Int = match json.get("iat") {
    Some(Number(iat)) => iat.to_int()
    _ =>
      raise @json.JsonDecodeError(
        (path, "JWTPayload::from_json:iat expected Int"),
      )
  }
  { user_handle, iss, sub, exp, nbf, iat }
}
