# Nested inner hits

```
GET /department/_search
{
  "_source": false,
  "query": {
    "nested": {
      "path": "employees",
      "inner_hits": {
         "explain": true
         },
      "query": {
        "bool": {
          "must": [
            {
              "match": {
                "employees.position": "intern"
              }
            },
            {
               "range": {
                  "employees.age": {
                     "lte": 22
                  }
               }
            },
            {
              "term": {
                "employees.gender.keyword": {
                  "value": "F"
                }
              }
            }
          ]
        }
      }
    }
  }
}
```
