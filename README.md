# golem-2024-hackathon

This is my entry to the Golem 2024 Hackathon contest.
For details, see: https://www.golem.cloud/post/golem-1-0-hackathon-happens-on-august-31st-2024

## API Endpoints

All commands can accept an optional '-debug' argument do show the equivalent
`curl` command used to communicate with the Golem backend.

### Register a new User Account :heavy_check_mark:

```bash
$ ./scripts/register-new-user.sh 'user-handle' 'password'
```

### Follow/Unfollow another user

```bash
$ ./scripts/follow-user.sh 'this-user-handle' '@other-user'
```

```bash
$ ./scripts/unfollow-user.sh 'this-user-handle' '@other-user'
```

### Post a Tweet

```bash
$ ./scripts/post-tweet.sh 'this-user-handle' 'Tweet contents'
```

### Read Tweets chronologically from _all_ followed users

```bash
$ ./scripts/read-all-timeline.sh 'this-user-handle' [before-timestamp]
```

### Read Tweets chronologically from any individual user

```bash
$ ./scripts/read-user-timeline.sh 'this-user-handle' '@other-user-handle' [before-timestamp]
```

### Update profile picture

```bash
$ ./scripts/update-profile-picture.sh 'this-user-handle' picture.jpg
```

### Delete a user account

```bash
$ ./scripts/delete-user.sh 'user-handle'
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
export GOLEM_2024_HACKATHON_USER1_XID=

export GOLEM_2024_HACKATHON_USER2_PASSWORD=hackathon-user-2-password
export GOLEM_2024_HACKATHON_USER2_XID=
...
```