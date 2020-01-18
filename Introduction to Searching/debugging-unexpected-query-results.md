# Debugging unexpected query results

```
GET /product/_explain/1
{
  "query": {
    "term": {
      "name": "lobster"
    }
  }
}

GET /product/_explain/19
{
  "query": {
    "term": {
      "name": "lobster"
    }
  }
}
```

PUT /product/1
{"name":"Wine - Maipo Valle Cabernet","price":152,"in_stock":38,"sold":47,"tags":["Alcohol","Wine"],"description":"Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.","is_active":true,"created":"2004\/05\/13"}

