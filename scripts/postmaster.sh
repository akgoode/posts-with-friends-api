#!/bin/sh

API="http://localhost:4741"
URL_PATH="/posts"
TITLE="hi"
CONTENT="blahblah"
USER=1
VERB=POST

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request ${VERB} \
  --header "Content-Type: application/json" \
  --data '{
    "post": {
      "title": "'"${TITLE}"'",
      "content": "'"${CONTENT}"'",
      "profile_id": "'"${USER}"'"
    }
  }'

echo
