# golem-2024-hackathon - ARCHIVED

This is my entry to the Golem 2024 Hackathon contest.
For details, see: https://www.golem.cloud/post/golem-1-0-hackathon-happens-on-august-31st-2024

## Retrospective & Key Learnings

This entry won 2nd place in the Hackathon which was a lot of fun.

Many thanks go to the other contestants and to the Golem team for their
help on Discord during the event.

John De Goes pointed out that this design has the flaw that API communication
to the individual `user` workers all gets forwarded through the `user-manager`
worker, and I totally agree. It turns out that I wasn't aware that API endpoints
were able to talk to individual workers without setting them up before-hand so
I thought this was a technical limitation of the platform, but in reality it
is indeed possible, which is fantastic.

I chose to use the [MoonBit] programming language for this Hackathon because
I'm enjoying learning it a great deal. It turns out that this was a significant
handicap for this Hackthon not only because it isn't an officially-supported
language, but also because worker-to-worker communication was a requirement
and the only support Golem currently has for worker-to-worker communication
using RPC is written in Rust.

I'm archiving this repo to preserve its state, but look forward to learning
a lot more about Golem and building new fun projects on it in the future.

[MoonBit]: https://moonbitlang.com/

## API Endpoints

All commands can accept an optional '-debug' argument do show the equivalent
`curl` command used to communicate with the Golem backend.

### Register a new User Account

HMAC-protected API endpoint: `POST /v1/users`

```bash
$ ./scripts/register-new-user.sh [-debug] -handle 'user-handle' -password 'password'
```

### Get info about another user

JWT-protected API endpoint: `GET /v1/users/{user_handle}`

```bash
$ ./scripts/get-user-info.sh [-debug] -user 'this-user-handle' -handle 'other-user-handle'
```

### Follow/Unfollow another user

JWT-protected API endpoint: `GET /v1/follows`

```bash
$ ./scripts/following.sh [-debug] -user 'this-user-handle'
```

JWT-protected API endpoint: `PUT /v1/follows`

```bash
$ ./scripts/follow-user.sh [-debug] -user 'this-user-handle' -handle 'other-user-handle'
```

JWT-protected API endpoint: `DELETE /v1/follows/{other_handle}`

```bash
$ ./scripts/unfollow-user.sh [-debug] -user 'this-user-handle' -handle 'other-user-handle'
```

### Post a Tweet

JWT-protected API endpoint: `POST /v1/tweets`

```bash
$ ./scripts/post-tweet.sh [-debug] -user 'this-user-handle' 'Tweet contents'
```

### Get a Tweet

JWT-protected API endpoint: `GET /v1/tweets/{tweet_xid}`

```bash
$ ./scripts/get-tweet.sh [-debug] -user 'this-user-handle' 'Tweet contents'
```

### Read Tweets chronologically from _all_ followed users (most recent first)

JWT-protected API endpoint: `GET /v1/tweets?before={timestamp}`

```bash
$ ./scripts/read-all-timeline.sh [-debug] -user 'this-user-handle' -before [before-timestamp]
```

### Read Tweets chronologically from any individual user

JWT-protected API endpoint: `GET /v1/tweets/{user_handle}?before={timestamp}`

```bash
$ ./scripts/read-user-timeline.sh [-debug] -user 'this-user-handle' -handle 'other-user-handle' -before [before-timestamp]
```

### Update profile picture

JWT-protected API endpoint: `PUT /v1/users/{user_handle}/profile-picture`

```bash
$ ./scripts/update-profile-picture.sh [-debug] -user 'this-user-handle' -filename picture.jpg
```

### Delete a user account

JWT-protected API endpoint: `DELETE /v1/users/{user_handle}`

```bash
$ ./scripts/delete-user.sh [-debug] -user 'user-handle'
```

## Running locally

To run locally, you first need to set up a ".env.development.local" file
at the top-level of this cloned repo and supply the following environment
variables containing information and secrets used to communicate with the
Golem backend. Test user handles and passwords are also stored as env vars
in this file to facilitate local development, testing, and demoing.

The following env vars need to be set up in this file:

```bash
export GOLEM_2024_HACKATHON_BASE_URL=https://your-golem-endpoint-base-url
export GOLEM_2024_HACKATHON_PROJECT_NAME="<username>-golem-2024-hackathon"
export GOLEM_2024_HACKATHON_PROJECT_ID='0123-789'
export GOLEM_2024_HACKATHON_CLIENT_ID='golem-2024-hackathon-client-id'
export GOLEM_2024_HACKATHON_CLIENT_SECRET='abc123!@#$%...xyz'

export GOLEM_2024_HACKATHON_USER1_PASSWORD=hackathon-user-1-password
export GOLEM_2024_HACKATHON_USER1_XID=...
export GOLEM_2024_HACKATHON_USER1_WORKER="urn:worker:.../user-1"

export GOLEM_2024_HACKATHON_USER2_PASSWORD=hackathon-user-2-password
export GOLEM_2024_HACKATHON_USER2_XID=...
export GOLEM_2024_HACKATHON_USER2_WORKER="urn:worker:.../user-2"

...

export GOLEM_2024_HACKATHON_PUBLIC_KEY=$(cat <<EOF
-----BEGIN PUBLIC KEY-----
MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAvmzL/vAZcQ4+Rq9Bm2oR
...
WcBCEtXZ/q34nRnREtfj8WMCAwEAAQ==
-----END PUBLIC KEY-----
EOF
)

export GOLEM_2024_HACKATHON_PRIVATE_KEY=$(cat <<EOF2
-----BEGIN ENCRYPTED PRIVATE KEY-----
...
-----END ENCRYPTED PRIVATE KEY-----
EOF2
)
```

Then there are two components to build: `user-manager` and `user`.

```bash
$ cd components/user-manager
$ ./build.sh
$ cd ../user
$ ./build.sh
```

At this point, you can upload the components and start trying
out the API endpoints.
