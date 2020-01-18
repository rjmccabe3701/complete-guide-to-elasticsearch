# Metric aggregations

## Calculating statistics with `sum`, `avg`, `min`, and `max` aggregations

```
GET /order/_doc/_search
{
  "size": 0,
  "aggs": {
    "total_sales": {
      "sum": {
        "field": "total_amount"
      }
    },
    "avg_sale": {
      "avg": {
        "field": "total_amount"
      }
    },
    "min_sale": {
      "min": {
        "field": "total_amount"
      }
    },
    "max_sale": {
      "max": {
        "field": "total_amount"
      }
    }
  }
}
```

## Retrieving the number of distinct values

```
GET /order/_doc/_search
{
  "size": 0,
  "aggs": {
    "total_salesmen": {
      "cardinality": {
        "field": "salesman.id"
      }
    }
  }
}
```

## Retrieving the number of values

```
GET /order/_doc/_search
{
  "size": 0,
  "aggs": {
    "values_count": {
      "value_count": {
        "field": "total_amount"
      }
    }
  }
}
```

## Using `stats` aggregation for common statistics

```
GET /order/_doc/_search
{
  "size": 0,
  "aggs": {
    "amount_stats": {
      "stats": {
        "field": "total_amount"
      }
    }
  }
}
```

                "combine_scriptss : "double profit = 0; for (t in state.transactions) { profit += t } return profit",

GET /order/_doc/_search
{
   "query" : {
      "match_all" : {}
   },
   "aggs": {
      "min_lines": {
         "nested": { "path" : "lines"},
         "aggs": {
            "inner_min_lines":{
               "scripted_metric": {
                  "init_script" : "state.transactions = []",
                  "map_script" : "state.transactions.add(doc.lines.count)",
                  "combine_script" : "return state.transactions",
                  "reduce_script" : "double min = 1000; for (a in states.transactions) {  if(min > a) { min = a } } return a"
               }
            }
         }
      }
   }
}

