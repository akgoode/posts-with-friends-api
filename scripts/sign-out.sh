#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/sign-out"
TOKEN="BAhJIiU0NDAyZTU5MDVkZmViZmEwYzllNmQ0YmM2MmM5YmQyMQY6BkVG--ac739079f8a77047bc887746ded86d2f2982a289"
ID=1
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"

echo
