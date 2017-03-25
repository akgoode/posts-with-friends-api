#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/posts"
TOKEN="BAhJIiUwYjQyMWU4ZWM4Yjc0ODcxNTc0NGE4NTEwZTQ5MzUzNQY6BkVG--be27414aaa4dab10ef277f1cf1a50fd8cc1d044f"
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
