#!/bin/sh

API="http://localhost:4741"
URL_PATH="/profiles"
# ID=""
TOKEN="BAhJIiU5ODQ5Yzk1YmU4ZTZhZWU5ODRlNTVhNWUyZjI3MTE0YQY6BkVG--2155d39d3f3f9c3cf6d2fb5bcd5d289c9b480efe"
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
      "last_name": "'"${LAST}"'"
    }
  }'

echo
