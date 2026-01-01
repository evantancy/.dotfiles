- generate a curl request for me to import it into my bruno collection
- format any query parameters like {item_id} as :item_id

for example:

```curl
curl --location --request PATCH 'http://localhost:3000/api/v1/menu/{item_id}/sold-out' \
 --header 'Content-Type: application/json' \
 --data '{
"isSoldOut": true
}'
```

should be

```curl
curl --location --request PATCH 'http://localhost:3000/api/v1/menu/:item_id/sold-out' \
 --header 'Content-Type: application/json' \
 --data '{
"isSoldOut": true
}'
```
