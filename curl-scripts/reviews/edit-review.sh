#!/bin/bash

curl "http://localhost:4741/reviews/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "review": {
      "name": "'"${NAME}"'",
      "ramen_type": "'"${RAMEN_TYPE}"'",
      "price": "'"${PRICE}"'",
      "rating": "'"${RATING}"'",
      "location": "'"${LOCATION}"'",
      "comments": "'"${COMMENTS}"'"
    }
  }'

echo
