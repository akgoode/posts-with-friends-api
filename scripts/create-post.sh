#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/posts"
TOKEN="BAhJIiU0NDAyZTU5MDVkZmViZmEwYzllNmQ0YmM2MmM5YmQyMQY6BkVG--ac739079f8a77047bc887746ded86d2f2982a289"
TITLE="best post ever"
CONTENT="blahblahblahblah"
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
