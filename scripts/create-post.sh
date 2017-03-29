#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/posts"
TOKEN=""
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
