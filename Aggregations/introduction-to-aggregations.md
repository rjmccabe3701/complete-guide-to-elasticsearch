# Introduction to aggregations

## Adding `order` index and mappings

```
PUT /order
{
  "mappings": {
    "_doc": {
      "properties": {
        "purchased_at": {
          "type": "date"
        },
        "lines": {
          "type": "nested",
          "properties": {
            "product_id": {
              "type": "integer"
            },
            "amount": {
              "type": "double"
            },
            "quantity": {
              "type": "short"
            }
          }
        },
        "total_amount": {
          "type": "double"
        },
        "status": {
          "type": "keyword"
        },
        "sales_channel": {
          "type": "keyword"
        },
        "salesman": {
          "type": "object",
          "properties": {
            "id": {
              "type": "integer"
            },
            "name": {
              "type": "text"
            }
          }
        }
      }
    }
  }
}
```

## Populating the `order` index with test data

```
curl -H "Content-Type: application/json" -XPOST 'http://localhost:9200/order/_doc/_bulk?pretty' --data-binary "@orders-bulk.json"
```


---
GET order/_search
{
  "query": {
    "match_all": {}
  },
  "sort": [
      {
         "lines.quantity": {
            "order" "desc",
            "mode": "avg"
         }
      }
   ]
}

GET /order/_search?size=2
{
  "_source": true,
  "query": {
     "bool" : {
        "filter" : {
           "script" : {
              "script" : {
                 "source": "doc["lines"].length > 1",
                 "lang": "painless"
              }
           }
        }
     }
  }
}

GET /order/_search?size=2
{
  "_source": true,
  "query": {
     "bool" : {
        "filter" : {
           "script" : {
              "script" : {
                 "source": "doc['lines'].length > 1",
                 "lang": "painless"
              }
           }
        }
     }
  },
  "sort": [
    {
      "lines.amount": {
          "order": "desc",
          "mode": "max"
      }
    }
    ]

}


GET /order/_search
{
  "_source": true,
  "query": {
    "nested": {
       "path": "lines",
       "query": {
          "bool": {
             "must" : [
             {
                "exists": {
                   "field": ""
                }
             }
             ]
          }
       }
    }
  }
}


