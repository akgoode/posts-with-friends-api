#!/bin/sh

API="http://localhost:4741"
URL_PATH="/profiles"
# ID=""
TOKEN="BAhJIiU3NDNlOTkyNGQwNmI2NTViMTExMDQ1ODgyNGRmZDQ3MAY6BkVG--e6aef94ff54c70f4492ef3073755e59972e7516a"
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
