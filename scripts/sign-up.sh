#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/sign-up"
EMAIL="hi@hi.com"
PASSWORD="hi"
curl "${API}${URL_PATH}" \
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

echo
