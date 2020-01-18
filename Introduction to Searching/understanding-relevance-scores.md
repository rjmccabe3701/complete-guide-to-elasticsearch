# Understanding relevance scores

```
GET /product/_search?explain
{
  "explain": true,
  "query": {
    "term": {
      "name": "lobster"
    }
  }
}
```

```
GET /product/_search?explain=true
{
  "query": {
    "term": {
      "name": "lobster"
    }
  }
}
```
