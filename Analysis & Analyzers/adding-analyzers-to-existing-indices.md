# Adding Analyzers to existing indicies


```
POST /analyzers_test/_close
```

```
PUT /analyzers_test/_settings
{
  "settings": {
    "analysis": {
      "analyzer": {
        "french_stop": {
          "type": "standard",
          "stopwords": "_french_"
        }
      }
    }
  }
}
```

```
POST /analyzers_test/_open
```
