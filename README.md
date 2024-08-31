# golem-2024-hackathon

This is my entry to the Golem 2024 Hackathon contest.
For details, see: https://www.golem.cloud/post/golem-1-0-hackathon-happens-on-august-31st-2024

## Register a new User Account

```bash
$ ./scripts/register-new-user.sh 'user-handle'
```

## Follow/Unfollow another user

```bash
$ ./scripts/follow-user.sh user-xid '@other-user'
```

```bash
$ ./scripts/unfollow-user.sh user-xid '@other-user'
```

## Post a Tweet

```bash
$ ./scripts/post-tweet.sh user-xid 'Tweet contents'
```

## Read Tweets chronologically from _all_ followed users

```bash
$ ./scripts/read-all-timeline.sh user-xid [after-timestamp]
```

## Read Tweets chronologically from any individual user

```bash
$ ./scripts/read-user-timeline.sh user-xid '@user-handle' [after-timestamp]
```

## Update profile picture

```bash
$ ./scripts/update-profile-picture.sh user-xid picture.jpg
```

## Delete a user account

```bash
$ ./scripts/delete-user.sh user-xid
```
