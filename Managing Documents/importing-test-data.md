# Importing test data

## Navigating to bulk file directory

```
cd /path/to/data/file/directory
```

## Importing test data with cURL

``
curl -H "Content-Type: application/json" -XPOST 'http://localhost:9200/product/_doc/_bulk?pretty' --data-binary "@products-bulk.json"

curl -u elastic:tH41yQpXaekgsixOXRricHJW  -H "Content-Type: application/json" -XPOST "https://245eb1314b86435f9ae6a56e9b5f02fd.us-central1.gcp.cloud.es.io:9243/product/_bulk?pretty" --data-binary "@products-bulk.json"
```


