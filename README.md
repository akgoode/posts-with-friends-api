# Posts With Friends API

### By Andrew Goode

## Installation

1.  Fork and clone this repository.
2.  Install dependencies with `bundle install`.
3.  Create a `.env` for sensitive settings (`touch .env`).
4.  Generate new `development` and `test` secrets (`bundle exec rake secret`).
5.  Store them in `.env` with keys `SECRET_KEY_BASE_<DEVELOPMENT|TEST>`
    respectively.
6.  Setup your database with `bin/rake db:nuke_pave` or `bundle exec rake
    db:nuke_pave`.
7.  Run the API server with `bin/rails server` or `bundle exec rails server`.

## Dependencies

Install with `bundle install`.

-   [`rails-api`](https://github.com/rails-api/rails-api)
-   [`rails`](https://github.com/rails/rails)
-   [`active_model_serializers`](https://github.com/rails-api/active_model_serializers)
-   [`ruby`](https://www.ruby-lang.org/en/)
-   [`postgres`](http://www.postgresql.org)

## Links

#### Deployed App:
https://akgoode.github.io/posts-with-friends/
#### Front-end repo:
https://github.com/akgoode/posts-with-friends
#### Deployed back-end:
https://still-shelf-67479.herokuapp.com/

## Approach

Initially I created a complex ERD for this app, which involved users being friends with each other and having posts be a resource on the join table between users.  I quickly moved this ERD to be a stretch goal and descoped my project to a simple ERD which is shown below.  For project week I wanted my focus to be on ember and producing a quality app in a front-end framework.  As a result, my back-end is much simpler than originally planned.

## Goals

As I continue to add features to Posts-With-Friends I will create other resources.  Near the top of the list is "followees" which will be users that the logged-in user follows.  When that is complete I will create comments so that users can interact with each other's posts.

## ERD

http://imgur.com/a/9WHq0

The back end has one resource called posts that belong to a user.

A user can have many posts.

## API

Defined below are the endpoints accessible using the posts-with-friends-api.

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH "http://localhost:4741/change-password/$ID" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
ID=1 OLDPW=hannah NEWPW=elle TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl http://localhost:4741/sign-out/$ID \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl http://localhost:4741/users \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "bob@ava.com"
    },
    {
      "id": 1,
      "email": "ava@bob.com"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "bob@ava.com"
  }
}
```

### Posts

Post data is read only from this API, so a token is needed to perform any action besides GET.

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/posts`             | `posts#create`    |
| GET   | `/posts`             | `posts#index`    |
| GET    | `/posts/:id`          | `posts#show`
| PATCH  | `/posts/:id` | `posts#update`  |
| DELETE | `/posts/:id`        | `posts#destroy`   |

#### POST /posts

Request:

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/posts"
TITLE="best post ever"
CONTENT="test post please ignore"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "post": {
      "title": "'"${TITLE}"'",
      "content": "'"${CONTENT}"'"
    }
  }'

echo
```

```sh
TOKEN="<token>" scripts/create-post.sh
```

Response:

```md
HTTP/1.1 201 CREATED
Content-Type: application/json; charset=utf-8

{
"post": {
    id: 1,
    title:"best post ever",
    content:"test post please ignore",
    editable:true
  }
}
```

#### GET /posts

Request:

```sh
#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/posts"
curl "${API}${URL_PATH}" \
  --include \
  --request GET

echo
```

```sh
scripts/get-posts.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "posts": [
  {
    "id":16,
    "title":"a rather excellent post",
    "content":"why yes indeed",
    "editable":true
  },
  {
    "id":18,
    "title":"This user doesn't own this post",
    "content":"Because editable is false",
    "editable":false
  } ]
}
```

#### GET /posts/:id

Request:

```sh
#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/posts"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET

echo
```

```sh
ID=<ID> scripts/get-post.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "post":
  {
    "id":16,
    "title":"a rather excellent post",
    "content":"why yes indeed",
    "editable":true
  }
}
```

#### PATCH /posts/:id

Request:

```sh
#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/posts"
TOKEN="<token>"
TITLE="new Title"
CONTENT="new content"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "post": {
      "title": "'"${TITLE}"'",
      "content": "'"${CONTENT}"'"
    }
  }'

echo
```

```sh
ID=1 scripts/update-post.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /posts/:id

Request:

```sh
#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/posts"
TOKEN="<token>"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN" \

echo
```

```sh
ID=1 sh scripts/delete-post.sh
```

Response:

```md
HTTP/1.1 204 No Content
```
