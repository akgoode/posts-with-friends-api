#!/bin/sh

API="http://localhost:4741"
URL_PATH="/profiles"
# ID=""
TOKEN="BAhJIiUyZGRjMmFhMTU4ZGViYmI0NDNmMjk2OThlNDBlZGJhNQY6BkVG--9d00e7679d7fad4977cdbd5518043fc9b3a872d7"
USERNAME="akgoode"
FIRST="Andrew"
LAST="Goode"
VERB=POST

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request ${VERB} \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "profile": {
      "username": "'"${USERNAME}"'",
      "first_name": "'"${FIRST}"'",
      "last_name": "'"${LAST}"'",
      "user_id": 1
    }
  }'

echo
