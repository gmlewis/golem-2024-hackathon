#![allow(warnings)]
use golem_wasm_rpc::*;
#[allow(dead_code)]
mod bindings;
pub struct Api {
    rpc: WasmRpc,
}
impl Api {}
pub struct FutureFollowingResult {
    pub future_invoke_result: FutureInvokeResult,
}
pub struct FutureFollowUserResult {
    pub future_invoke_result: FutureInvokeResult,
}
pub struct FutureUnfollowUserResult {
    pub future_invoke_result: FutureInvokeResult,
}
pub struct FuturePostTweetResult {
    pub future_invoke_result: FutureInvokeResult,
}
pub struct FutureGetTweetResult {
    pub future_invoke_result: FutureInvokeResult,
}
pub struct FutureListAllFollowedTweetsResult {
    pub future_invoke_result: FutureInvokeResult,
}
pub struct FutureListUserTweetsResult {
    pub future_invoke_result: FutureInvokeResult,
}
struct Component;
impl crate::bindings::exports::golem::component_stub::stub_user_manager::Guest
for Component {
    type Api = crate::Api;
    type FutureFollowingResult = crate::FutureFollowingResult;
    type FutureFollowUserResult = crate::FutureFollowUserResult;
    type FutureUnfollowUserResult = crate::FutureUnfollowUserResult;
    type FuturePostTweetResult = crate::FuturePostTweetResult;
    type FutureGetTweetResult = crate::FutureGetTweetResult;
    type FutureListAllFollowedTweetsResult = crate::FutureListAllFollowedTweetsResult;
    type FutureListUserTweetsResult = crate::FutureListUserTweetsResult;
}
impl crate::bindings::exports::golem::component_stub::stub_user_manager::GuestFutureFollowingResult
for FutureFollowingResult {
    fn subscribe(&self) -> bindings::wasi::io::poll::Pollable {
        let pollable = self.future_invoke_result.subscribe();
        let pollable = unsafe {
            bindings::wasi::io::poll::Pollable::from_handle(pollable.take_handle())
        };
        pollable
    }
    fn get(&self) -> Option<crate::bindings::golem::component::api::FollowingResult> {
        self.future_invoke_result
            .get()
            .map(|result| {
                let result = result
                    .expect(
                        &format!(
                            "Failed to invoke remote {}",
                            "golem:component/api.{following}"
                        ),
                    );
                ({
                    let (case_idx, inner) = result
                        .tuple_element(0)
                        .expect("tuple not found")
                        .variant()
                        .expect("variant not found");
                    match case_idx {
                        0u32 => {
                            crate::bindings::golem::component::api::FollowingResult::Error(
                                inner
                                    .expect("variant case not found")
                                    .string()
                                    .expect("string not found")
                                    .to_string(),
                            )
                        }
                        1u32 => {
                            crate::bindings::golem::component::api::FollowingResult::Success({
                                let record = inner.expect("variant case not found");
                                crate::bindings::golem::component::api::ListFollowing {
                                    user_xids: record
                                        .field(0usize)
                                        .expect("record field not found")
                                        .list_elements(|item| {
                                            item.string().expect("string not found").to_string()
                                        })
                                        .expect("list not found"),
                                }
                            })
                        }
                        _ => unreachable!("invalid variant case index"),
                    }
                })
            })
    }
}
impl crate::bindings::exports::golem::component_stub::stub_user_manager::GuestFutureFollowUserResult
for FutureFollowUserResult {
    fn subscribe(&self) -> bindings::wasi::io::poll::Pollable {
        let pollable = self.future_invoke_result.subscribe();
        let pollable = unsafe {
            bindings::wasi::io::poll::Pollable::from_handle(pollable.take_handle())
        };
        pollable
    }
    fn get(
        &self,
    ) -> Option<crate::bindings::golem::component::api::SuccessOrFailureResult> {
        self.future_invoke_result
            .get()
            .map(|result| {
                let result = result
                    .expect(
                        &format!(
                            "Failed to invoke remote {}",
                            "golem:component/api.{follow-user}"
                        ),
                    );
                ({
                    let (case_idx, inner) = result
                        .tuple_element(0)
                        .expect("tuple not found")
                        .variant()
                        .expect("variant not found");
                    match case_idx {
                        0u32 => {
                            crate::bindings::golem::component::api::SuccessOrFailureResult::Error(
                                inner
                                    .expect("variant case not found")
                                    .string()
                                    .expect("string not found")
                                    .to_string(),
                            )
                        }
                        1u32 => {
                            crate::bindings::golem::component::api::SuccessOrFailureResult::Success(
                                inner
                                    .expect("variant case not found")
                                    .string()
                                    .expect("string not found")
                                    .to_string(),
                            )
                        }
                        _ => unreachable!("invalid variant case index"),
                    }
                })
            })
    }
}
impl crate::bindings::exports::golem::component_stub::stub_user_manager::GuestFutureUnfollowUserResult
for FutureUnfollowUserResult {
    fn subscribe(&self) -> bindings::wasi::io::poll::Pollable {
        let pollable = self.future_invoke_result.subscribe();
        let pollable = unsafe {
            bindings::wasi::io::poll::Pollable::from_handle(pollable.take_handle())
        };
        pollable
    }
    fn get(
        &self,
    ) -> Option<crate::bindings::golem::component::api::SuccessOrFailureResult> {
        self.future_invoke_result
            .get()
            .map(|result| {
                let result = result
                    .expect(
                        &format!(
                            "Failed to invoke remote {}",
                            "golem:component/api.{unfollow-user}"
                        ),
                    );
                ({
                    let (case_idx, inner) = result
                        .tuple_element(0)
                        .expect("tuple not found")
                        .variant()
                        .expect("variant not found");
                    match case_idx {
                        0u32 => {
                            crate::bindings::golem::component::api::SuccessOrFailureResult::Error(
                                inner
                                    .expect("variant case not found")
                                    .string()
                                    .expect("string not found")
                                    .to_string(),
                            )
                        }
                        1u32 => {
                            crate::bindings::golem::component::api::SuccessOrFailureResult::Success(
                                inner
                                    .expect("variant case not found")
                                    .string()
                                    .expect("string not found")
                                    .to_string(),
                            )
                        }
                        _ => unreachable!("invalid variant case index"),
                    }
                })
            })
    }
}
impl crate::bindings::exports::golem::component_stub::stub_user_manager::GuestFuturePostTweetResult
for FuturePostTweetResult {
    fn subscribe(&self) -> bindings::wasi::io::poll::Pollable {
        let pollable = self.future_invoke_result.subscribe();
        let pollable = unsafe {
            bindings::wasi::io::poll::Pollable::from_handle(pollable.take_handle())
        };
        pollable
    }
    fn get(
        &self,
    ) -> Option<crate::bindings::golem::component::api::SuccessOrFailureResult> {
        self.future_invoke_result
            .get()
            .map(|result| {
                let result = result
                    .expect(
                        &format!(
                            "Failed to invoke remote {}",
                            "golem:component/api.{post-tweet}"
                        ),
                    );
                ({
                    let (case_idx, inner) = result
                        .tuple_element(0)
                        .expect("tuple not found")
                        .variant()
                        .expect("variant not found");
                    match case_idx {
                        0u32 => {
                            crate::bindings::golem::component::api::SuccessOrFailureResult::Error(
                                inner
                                    .expect("variant case not found")
                                    .string()
                                    .expect("string not found")
                                    .to_string(),
                            )
                        }
                        1u32 => {
                            crate::bindings::golem::component::api::SuccessOrFailureResult::Success(
                                inner
                                    .expect("variant case not found")
                                    .string()
                                    .expect("string not found")
                                    .to_string(),
                            )
                        }
                        _ => unreachable!("invalid variant case index"),
                    }
                })
            })
    }
}
impl crate::bindings::exports::golem::component_stub::stub_user_manager::GuestFutureGetTweetResult
for FutureGetTweetResult {
    fn subscribe(&self) -> bindings::wasi::io::poll::Pollable {
        let pollable = self.future_invoke_result.subscribe();
        let pollable = unsafe {
            bindings::wasi::io::poll::Pollable::from_handle(pollable.take_handle())
        };
        pollable
    }
    fn get(
        &self,
    ) -> Option<crate::bindings::golem::component::api::SuccessOrFailureResult> {
        self.future_invoke_result
            .get()
            .map(|result| {
                let result = result
                    .expect(
                        &format!(
                            "Failed to invoke remote {}",
                            "golem:component/api.{get-tweet}"
                        ),
                    );
                ({
                    let (case_idx, inner) = result
                        .tuple_element(0)
                        .expect("tuple not found")
                        .variant()
                        .expect("variant not found");
                    match case_idx {
                        0u32 => {
                            crate::bindings::golem::component::api::SuccessOrFailureResult::Error(
                                inner
                                    .expect("variant case not found")
                                    .string()
                                    .expect("string not found")
                                    .to_string(),
                            )
                        }
                        1u32 => {
                            crate::bindings::golem::component::api::SuccessOrFailureResult::Success(
                                inner
                                    .expect("variant case not found")
                                    .string()
                                    .expect("string not found")
                                    .to_string(),
                            )
                        }
                        _ => unreachable!("invalid variant case index"),
                    }
                })
            })
    }
}
impl crate::bindings::exports::golem::component_stub::stub_user_manager::GuestFutureListAllFollowedTweetsResult
for FutureListAllFollowedTweetsResult {
    fn subscribe(&self) -> bindings::wasi::io::poll::Pollable {
        let pollable = self.future_invoke_result.subscribe();
        let pollable = unsafe {
            bindings::wasi::io::poll::Pollable::from_handle(pollable.take_handle())
        };
        pollable
    }
    fn get(&self) -> Option<crate::bindings::golem::component::api::ListTweetsResult> {
        self.future_invoke_result
            .get()
            .map(|result| {
                let result = result
                    .expect(
                        &format!(
                            "Failed to invoke remote {}",
                            "golem:component/api.{list-all-followed-tweets}"
                        ),
                    );
                ({
                    let (case_idx, inner) = result
                        .tuple_element(0)
                        .expect("tuple not found")
                        .variant()
                        .expect("variant not found");
                    match case_idx {
                        0u32 => {
                            crate::bindings::golem::component::api::ListTweetsResult::Error(
                                inner
                                    .expect("variant case not found")
                                    .string()
                                    .expect("string not found")
                                    .to_string(),
                            )
                        }
                        1u32 => {
                            crate::bindings::golem::component::api::ListTweetsResult::Success({
                                let record = inner.expect("variant case not found");
                                crate::bindings::golem::component::api::ListTweets {
                                    tweets: record
                                        .field(0usize)
                                        .expect("record field not found")
                                        .list_elements(|item| {
                                            let record = item;
                                            crate::bindings::golem::component::api::Tweet {
                                                user_xid: record
                                                    .field(0usize)
                                                    .expect("record field not found")
                                                    .string()
                                                    .expect("string not found")
                                                    .to_string(),
                                                tweet_contents: record
                                                    .field(1usize)
                                                    .expect("record field not found")
                                                    .string()
                                                    .expect("string not found")
                                                    .to_string(),
                                                tweet_xid: record
                                                    .field(2usize)
                                                    .expect("record field not found")
                                                    .string()
                                                    .expect("string not found")
                                                    .to_string(),
                                            }
                                        })
                                        .expect("list not found"),
                                }
                            })
                        }
                        _ => unreachable!("invalid variant case index"),
                    }
                })
            })
    }
}
impl crate::bindings::exports::golem::component_stub::stub_user_manager::GuestFutureListUserTweetsResult
for FutureListUserTweetsResult {
    fn subscribe(&self) -> bindings::wasi::io::poll::Pollable {
        let pollable = self.future_invoke_result.subscribe();
        let pollable = unsafe {
            bindings::wasi::io::poll::Pollable::from_handle(pollable.take_handle())
        };
        pollable
    }
    fn get(&self) -> Option<crate::bindings::golem::component::api::ListTweetsResult> {
        self.future_invoke_result
            .get()
            .map(|result| {
                let result = result
                    .expect(
                        &format!(
                            "Failed to invoke remote {}",
                            "golem:component/api.{list-user-tweets}"
                        ),
                    );
                ({
                    let (case_idx, inner) = result
                        .tuple_element(0)
                        .expect("tuple not found")
                        .variant()
                        .expect("variant not found");
                    match case_idx {
                        0u32 => {
                            crate::bindings::golem::component::api::ListTweetsResult::Error(
                                inner
                                    .expect("variant case not found")
                                    .string()
                                    .expect("string not found")
                                    .to_string(),
                            )
                        }
                        1u32 => {
                            crate::bindings::golem::component::api::ListTweetsResult::Success({
                                let record = inner.expect("variant case not found");
                                crate::bindings::golem::component::api::ListTweets {
                                    tweets: record
                                        .field(0usize)
                                        .expect("record field not found")
                                        .list_elements(|item| {
                                            let record = item;
                                            crate::bindings::golem::component::api::Tweet {
                                                user_xid: record
                                                    .field(0usize)
                                                    .expect("record field not found")
                                                    .string()
                                                    .expect("string not found")
                                                    .to_string(),
                                                tweet_contents: record
                                                    .field(1usize)
                                                    .expect("record field not found")
                                                    .string()
                                                    .expect("string not found")
                                                    .to_string(),
                                                tweet_xid: record
                                                    .field(2usize)
                                                    .expect("record field not found")
                                                    .string()
                                                    .expect("string not found")
                                                    .to_string(),
                                            }
                                        })
                                        .expect("list not found"),
                                }
                            })
                        }
                        _ => unreachable!("invalid variant case index"),
                    }
                })
            })
    }
}
impl crate::bindings::exports::golem::component_stub::stub_user_manager::GuestApi
for Api {
    fn new(location: crate::bindings::golem::rpc::types::Uri) -> Self {
        let location = golem_wasm_rpc::Uri {
            value: location.value,
        };
        Self {
            rpc: WasmRpc::new(&location),
        }
    }
    fn blocking_following(
        &self,
        jwt: String,
    ) -> crate::bindings::golem::component::api::FollowingResult {
        let result = self
            .rpc
            .invoke_and_await(
                "golem:component/api.{following}",
                &[WitValue::builder().string(&jwt)],
            )
            .expect(
                &format!(
                    "Failed to invoke-and-await remote {}",
                    "golem:component/api.{following}"
                ),
            );
        ({
            let (case_idx, inner) = result
                .tuple_element(0)
                .expect("tuple not found")
                .variant()
                .expect("variant not found");
            match case_idx {
                0u32 => {
                    crate::bindings::golem::component::api::FollowingResult::Error(
                        inner
                            .expect("variant case not found")
                            .string()
                            .expect("string not found")
                            .to_string(),
                    )
                }
                1u32 => {
                    crate::bindings::golem::component::api::FollowingResult::Success({
                        let record = inner.expect("variant case not found");
                        crate::bindings::golem::component::api::ListFollowing {
                            user_xids: record
                                .field(0usize)
                                .expect("record field not found")
                                .list_elements(|item| {
                                    item.string().expect("string not found").to_string()
                                })
                                .expect("list not found"),
                        }
                    })
                }
                _ => unreachable!("invalid variant case index"),
            }
        })
    }
    fn following(
        &self,
        jwt: String,
    ) -> crate::bindings::exports::golem::component_stub::stub_user_manager::FutureFollowingResult {
        let result = self
            .rpc
            .async_invoke_and_await(
                "golem:component/api.{following}",
                &[WitValue::builder().string(&jwt)],
            );
        crate::bindings::exports::golem::component_stub::stub_user_manager::FutureFollowingResult::new(FutureFollowingResult {
            future_invoke_result: result,
        })
    }
    fn blocking_follow_user(
        &self,
        other_user_xid: String,
        other_user_worker: String,
        jwt: String,
    ) -> crate::bindings::golem::component::api::SuccessOrFailureResult {
        let result = self
            .rpc
            .invoke_and_await(
                "golem:component/api.{follow-user}",
                &[
                    WitValue::builder().string(&other_user_xid),
                    WitValue::builder().string(&other_user_worker),
                    WitValue::builder().string(&jwt),
                ],
            )
            .expect(
                &format!(
                    "Failed to invoke-and-await remote {}",
                    "golem:component/api.{follow-user}"
                ),
            );
        ({
            let (case_idx, inner) = result
                .tuple_element(0)
                .expect("tuple not found")
                .variant()
                .expect("variant not found");
            match case_idx {
                0u32 => {
                    crate::bindings::golem::component::api::SuccessOrFailureResult::Error(
                        inner
                            .expect("variant case not found")
                            .string()
                            .expect("string not found")
                            .to_string(),
                    )
                }
                1u32 => {
                    crate::bindings::golem::component::api::SuccessOrFailureResult::Success(
                        inner
                            .expect("variant case not found")
                            .string()
                            .expect("string not found")
                            .to_string(),
                    )
                }
                _ => unreachable!("invalid variant case index"),
            }
        })
    }
    fn follow_user(
        &self,
        other_user_xid: String,
        other_user_worker: String,
        jwt: String,
    ) -> crate::bindings::exports::golem::component_stub::stub_user_manager::FutureFollowUserResult {
        let result = self
            .rpc
            .async_invoke_and_await(
                "golem:component/api.{follow-user}",
                &[
                    WitValue::builder().string(&other_user_xid),
                    WitValue::builder().string(&other_user_worker),
                    WitValue::builder().string(&jwt),
                ],
            );
        crate::bindings::exports::golem::component_stub::stub_user_manager::FutureFollowUserResult::new(FutureFollowUserResult {
            future_invoke_result: result,
        })
    }
    fn blocking_unfollow_user(
        &self,
        other_user_xid: String,
        jwt: String,
    ) -> crate::bindings::golem::component::api::SuccessOrFailureResult {
        let result = self
            .rpc
            .invoke_and_await(
                "golem:component/api.{unfollow-user}",
                &[
                    WitValue::builder().string(&other_user_xid),
                    WitValue::builder().string(&jwt),
                ],
            )
            .expect(
                &format!(
                    "Failed to invoke-and-await remote {}",
                    "golem:component/api.{unfollow-user}"
                ),
            );
        ({
            let (case_idx, inner) = result
                .tuple_element(0)
                .expect("tuple not found")
                .variant()
                .expect("variant not found");
            match case_idx {
                0u32 => {
                    crate::bindings::golem::component::api::SuccessOrFailureResult::Error(
                        inner
                            .expect("variant case not found")
                            .string()
                            .expect("string not found")
                            .to_string(),
                    )
                }
                1u32 => {
                    crate::bindings::golem::component::api::SuccessOrFailureResult::Success(
                        inner
                            .expect("variant case not found")
                            .string()
                            .expect("string not found")
                            .to_string(),
                    )
                }
                _ => unreachable!("invalid variant case index"),
            }
        })
    }
    fn unfollow_user(
        &self,
        other_user_xid: String,
        jwt: String,
    ) -> crate::bindings::exports::golem::component_stub::stub_user_manager::FutureUnfollowUserResult {
        let result = self
            .rpc
            .async_invoke_and_await(
                "golem:component/api.{unfollow-user}",
                &[
                    WitValue::builder().string(&other_user_xid),
                    WitValue::builder().string(&jwt),
                ],
            );
        crate::bindings::exports::golem::component_stub::stub_user_manager::FutureUnfollowUserResult::new(FutureUnfollowUserResult {
            future_invoke_result: result,
        })
    }
    fn blocking_post_tweet(
        &self,
        tweet_contents: String,
        tweet_xid: String,
        jwt: String,
    ) -> crate::bindings::golem::component::api::SuccessOrFailureResult {
        let result = self
            .rpc
            .invoke_and_await(
                "golem:component/api.{post-tweet}",
                &[
                    WitValue::builder().string(&tweet_contents),
                    WitValue::builder().string(&tweet_xid),
                    WitValue::builder().string(&jwt),
                ],
            )
            .expect(
                &format!(
                    "Failed to invoke-and-await remote {}",
                    "golem:component/api.{post-tweet}"
                ),
            );
        ({
            let (case_idx, inner) = result
                .tuple_element(0)
                .expect("tuple not found")
                .variant()
                .expect("variant not found");
            match case_idx {
                0u32 => {
                    crate::bindings::golem::component::api::SuccessOrFailureResult::Error(
                        inner
                            .expect("variant case not found")
                            .string()
                            .expect("string not found")
                            .to_string(),
                    )
                }
                1u32 => {
                    crate::bindings::golem::component::api::SuccessOrFailureResult::Success(
                        inner
                            .expect("variant case not found")
                            .string()
                            .expect("string not found")
                            .to_string(),
                    )
                }
                _ => unreachable!("invalid variant case index"),
            }
        })
    }
    fn post_tweet(
        &self,
        tweet_contents: String,
        tweet_xid: String,
        jwt: String,
    ) -> crate::bindings::exports::golem::component_stub::stub_user_manager::FuturePostTweetResult {
        let result = self
            .rpc
            .async_invoke_and_await(
                "golem:component/api.{post-tweet}",
                &[
                    WitValue::builder().string(&tweet_contents),
                    WitValue::builder().string(&tweet_xid),
                    WitValue::builder().string(&jwt),
                ],
            );
        crate::bindings::exports::golem::component_stub::stub_user_manager::FuturePostTweetResult::new(FuturePostTweetResult {
            future_invoke_result: result,
        })
    }
    fn blocking_get_tweet(
        &self,
        tweet_xid: String,
        jwt: String,
    ) -> crate::bindings::golem::component::api::SuccessOrFailureResult {
        let result = self
            .rpc
            .invoke_and_await(
                "golem:component/api.{get-tweet}",
                &[
                    WitValue::builder().string(&tweet_xid),
                    WitValue::builder().string(&jwt),
                ],
            )
            .expect(
                &format!(
                    "Failed to invoke-and-await remote {}",
                    "golem:component/api.{get-tweet}"
                ),
            );
        ({
            let (case_idx, inner) = result
                .tuple_element(0)
                .expect("tuple not found")
                .variant()
                .expect("variant not found");
            match case_idx {
                0u32 => {
                    crate::bindings::golem::component::api::SuccessOrFailureResult::Error(
                        inner
                            .expect("variant case not found")
                            .string()
                            .expect("string not found")
                            .to_string(),
                    )
                }
                1u32 => {
                    crate::bindings::golem::component::api::SuccessOrFailureResult::Success(
                        inner
                            .expect("variant case not found")
                            .string()
                            .expect("string not found")
                            .to_string(),
                    )
                }
                _ => unreachable!("invalid variant case index"),
            }
        })
    }
    fn get_tweet(
        &self,
        tweet_xid: String,
        jwt: String,
    ) -> crate::bindings::exports::golem::component_stub::stub_user_manager::FutureGetTweetResult {
        let result = self
            .rpc
            .async_invoke_and_await(
                "golem:component/api.{get-tweet}",
                &[
                    WitValue::builder().string(&tweet_xid),
                    WitValue::builder().string(&jwt),
                ],
            );
        crate::bindings::exports::golem::component_stub::stub_user_manager::FutureGetTweetResult::new(FutureGetTweetResult {
            future_invoke_result: result,
        })
    }
    fn blocking_list_all_followed_tweets(
        &self,
        before: String,
        limit: u32,
        jwt: String,
    ) -> crate::bindings::golem::component::api::ListTweetsResult {
        let result = self
            .rpc
            .invoke_and_await(
                "golem:component/api.{list-all-followed-tweets}",
                &[
                    WitValue::builder().string(&before),
                    WitValue::builder().u32(limit),
                    WitValue::builder().string(&jwt),
                ],
            )
            .expect(
                &format!(
                    "Failed to invoke-and-await remote {}",
                    "golem:component/api.{list-all-followed-tweets}"
                ),
            );
        ({
            let (case_idx, inner) = result
                .tuple_element(0)
                .expect("tuple not found")
                .variant()
                .expect("variant not found");
            match case_idx {
                0u32 => {
                    crate::bindings::golem::component::api::ListTweetsResult::Error(
                        inner
                            .expect("variant case not found")
                            .string()
                            .expect("string not found")
                            .to_string(),
                    )
                }
                1u32 => {
                    crate::bindings::golem::component::api::ListTweetsResult::Success({
                        let record = inner.expect("variant case not found");
                        crate::bindings::golem::component::api::ListTweets {
                            tweets: record
                                .field(0usize)
                                .expect("record field not found")
                                .list_elements(|item| {
                                    let record = item;
                                    crate::bindings::golem::component::api::Tweet {
                                        user_xid: record
                                            .field(0usize)
                                            .expect("record field not found")
                                            .string()
                                            .expect("string not found")
                                            .to_string(),
                                        tweet_contents: record
                                            .field(1usize)
                                            .expect("record field not found")
                                            .string()
                                            .expect("string not found")
                                            .to_string(),
                                        tweet_xid: record
                                            .field(2usize)
                                            .expect("record field not found")
                                            .string()
                                            .expect("string not found")
                                            .to_string(),
                                    }
                                })
                                .expect("list not found"),
                        }
                    })
                }
                _ => unreachable!("invalid variant case index"),
            }
        })
    }
    fn list_all_followed_tweets(
        &self,
        before: String,
        limit: u32,
        jwt: String,
    ) -> crate::bindings::exports::golem::component_stub::stub_user_manager::FutureListAllFollowedTweetsResult {
        let result = self
            .rpc
            .async_invoke_and_await(
                "golem:component/api.{list-all-followed-tweets}",
                &[
                    WitValue::builder().string(&before),
                    WitValue::builder().u32(limit),
                    WitValue::builder().string(&jwt),
                ],
            );
        crate::bindings::exports::golem::component_stub::stub_user_manager::FutureListAllFollowedTweetsResult::new(FutureListAllFollowedTweetsResult {
            future_invoke_result: result,
        })
    }
    fn blocking_list_user_tweets(
        &self,
        before: String,
        limit: u32,
        jwt: String,
    ) -> crate::bindings::golem::component::api::ListTweetsResult {
        let result = self
            .rpc
            .invoke_and_await(
                "golem:component/api.{list-user-tweets}",
                &[
                    WitValue::builder().string(&before),
                    WitValue::builder().u32(limit),
                    WitValue::builder().string(&jwt),
                ],
            )
            .expect(
                &format!(
                    "Failed to invoke-and-await remote {}",
                    "golem:component/api.{list-user-tweets}"
                ),
            );
        ({
            let (case_idx, inner) = result
                .tuple_element(0)
                .expect("tuple not found")
                .variant()
                .expect("variant not found");
            match case_idx {
                0u32 => {
                    crate::bindings::golem::component::api::ListTweetsResult::Error(
                        inner
                            .expect("variant case not found")
                            .string()
                            .expect("string not found")
                            .to_string(),
                    )
                }
                1u32 => {
                    crate::bindings::golem::component::api::ListTweetsResult::Success({
                        let record = inner.expect("variant case not found");
                        crate::bindings::golem::component::api::ListTweets {
                            tweets: record
                                .field(0usize)
                                .expect("record field not found")
                                .list_elements(|item| {
                                    let record = item;
                                    crate::bindings::golem::component::api::Tweet {
                                        user_xid: record
                                            .field(0usize)
                                            .expect("record field not found")
                                            .string()
                                            .expect("string not found")
                                            .to_string(),
                                        tweet_contents: record
                                            .field(1usize)
                                            .expect("record field not found")
                                            .string()
                                            .expect("string not found")
                                            .to_string(),
                                        tweet_xid: record
                                            .field(2usize)
                                            .expect("record field not found")
                                            .string()
                                            .expect("string not found")
                                            .to_string(),
                                    }
                                })
                                .expect("list not found"),
                        }
                    })
                }
                _ => unreachable!("invalid variant case index"),
            }
        })
    }
    fn list_user_tweets(
        &self,
        before: String,
        limit: u32,
        jwt: String,
    ) -> crate::bindings::exports::golem::component_stub::stub_user_manager::FutureListUserTweetsResult {
        let result = self
            .rpc
            .async_invoke_and_await(
                "golem:component/api.{list-user-tweets}",
                &[
                    WitValue::builder().string(&before),
                    WitValue::builder().u32(limit),
                    WitValue::builder().string(&jwt),
                ],
            );
        crate::bindings::exports::golem::component_stub::stub_user_manager::FutureListUserTweetsResult::new(FutureListUserTweetsResult {
            future_invoke_result: result,
        })
    }
}
bindings::export!(Component with_types_in bindings);
