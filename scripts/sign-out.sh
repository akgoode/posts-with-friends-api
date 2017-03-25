#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/sign-out"
TOKEN="BAhJIiUwYjQyMWU4ZWM4Yjc0ODcxNTc0NGE4NTEwZTQ5MzUzNQY6BkVG--be27414aaa4dab10ef277f1cf1a50fd8cc1d044f"
ID=1
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"

echo
