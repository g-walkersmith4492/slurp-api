#!/bin/bash

curl "http://localhost:4741/reviews" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
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
