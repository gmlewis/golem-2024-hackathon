/// `env_vars_map` contains environment variables cached by the worker.
let env_vars_map : Ref[Map[String, String]] = { val: {  } }

type! EnvVarError String derive(Show)

fn get_env_var(var_name : String) -> String!EnvVarError {
  // try to get env var from internal map
  match env_vars_map.val.get(var_name) {
    Some(value) => if value != "" { return value }
    _ => ()
  }
  // value does not exist in the map - get all env vars and update map
  update_all_env_vars()
  // try again to get value - and this time give up if not found
  match env_vars_map.val.get(var_name) {
    Some(value) => if value != "" { return value }
    _ => ()
  }
  // @log.error("env var '\{var_name}' not found")
  raise EnvVarError("env var '\{var_name}' not found")
}

fn update_all_env_vars() -> Unit {
  for pair in @environment.get_environment().iter() {
    let key = pair.0
    let value = @string.trim_space(pair.1)
    // if value == "" {
    //   @log.error("empty value for env var '\{key}'")
    // }
    env_vars_map.val.set(key, value)
    // let len = value.length()
    // @log.info("got env var '\{key}' of length \{len}")
  }
}
