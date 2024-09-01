pub fn post_tweet(
  tweet_contents : String,
  tweet_xid : String,
  jwt : String
) -> SuccessOrFailureResult {
  let payload = match validate_jwt(jwt) {
    Ok(payload) => payload
    Err(s) => return Error(s)
  }
  //
  let user_xid = payload.sub
  let user = match all_users.val.get(user_xid) {
    Some(user) => user
    _ => return Error("user \{user_xid} not found")
  }
  //
  let worker_urn = user.worker_urn
  let uri : @types.Uri = { value: worker_urn }
  let rpc = @types.WasmRpc::wasm_rpc(uri)
  let function_params : Array[@types.WitValue] = []
  let wit_value = match rpc.invoke_and_await("post_tweet", function_params) {
    Ok(wit_value) => wit_value
    Err(e) => return Error(e.to_string())
  }
  Success("yo")
}
