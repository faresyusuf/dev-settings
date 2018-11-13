PUT develop_productindex_batteriesexpert_fr-fr/_settings
{
  "index.indexing.slowlog.threshold.index.debug": "0s", 
"index.search.slowlog.threshold.fetch.debug" : "0s", 
"index.search.slowlog.threshold.query.debug": "0s"
}


GET develop_productindex_batteriesexpert_fr-fr_1539747393537/ProductSearch/_search
{
  
  
}

GET develop_productindex_batteriesexpert_fr-fr/_analyze
{
  "analyzer": "prefix_analyzer",
"text": ["1Automobiles et Camionettes_22013_3Hyundai-"]
}

GET develop_productindex_batteriesexpert_fr-fr/ProductSearch/_search
{
  "query": {
    "nested": {
      "path": "matchProductFinder",
      "query": 
      {
        "bool": 
        {
          "must": 
          [
            
            {
              "query_string": {
                "default_field": "matchProductFinder.keys",
                "query": "1ddf0b617b92733d5369e7cc626d2f4bf8a0b2e3c&2a68b8351560179aac558c46820cb57b9d16da7bf&37b9d5efbcfeb5fe1dc3720f73deb1700ec03eca5&42815f6b98b7a1fc00fc6bbb6d86583c410d86af7", 
                "minimum_should_match": "100%"
              }
            }
          ]
        }
      }
    } 
    
  }
}


GET develop_productindex_batteriesexpert_fr-fr/ProductSearch/_search
{
  "query": {
    "nested": {
      "path": "matchProductFinder",
      "query": 
      {
        "bool": 
        {
          "must": 
          [
            {
              "query_string": {
                "default_field": "matchProductFinder.keysOriginal",
                "query": "1Automobiles et Camionettes&22013&3Hyundai&4Accent&", 
                "minimum_should_match": "100%"
              }
            }
          ]
        }
      }
    } 
    
  }
}

GET develop_productindex_batteriesexpert_fr-fr/_mapping/ProductSearch/field/matchProductFinder.keysOriginal,matchProductFinder.keys


GET develop_productindex_batteriesexpert_fr-fr_1539747393537/ProductSearch/_search
{
  "query": {
    "nested": {
      "path": "matchProductFinder",
      "query": 
      {
        "bool": 
        {
          "must": 
          [
            
            {
              "query_string": {
                "default_field": "matchProductFinder.keys",
                "query": "1ddf0b617b92733d5369e7cc626d2f4bf8a0b2e3c&2d08b10a32612f9d3bc06be41124becfd39536eee&3f496efcf1e057428e16ff3f09a21776bf42b2749&4d4dbee0f76acbc9047cc859090e074c427fb1d87&", 
                "minimum_should_match": "100%"
              }
            }
          ]
        }
      }
    } 
    
  }
}



GET develop_productindex_batteriesexpert_fr-fr_1539747393537/_analyze
{
  "analyzer": "prefix_analyzer",
  "text": ["1ddf0b617b92733d5369e7cc626d2f4bf8a0b2e3c&2a68b8351560179aac558c46820cb57b9d16da7bf&37b9d5efbcfeb5fe1dc3720f73deb1700ec03eca5&42815f6b98b7a1fc00fc6bbb6d86583c410d86af7&5b40169426d1b019afe2aff41394a39b2ff8e4f0a&"]
}

GET develop_productindex_batteriesexpert_fr-fr_1539747393537/ProductSearch/_mapping

###
GET develop_productindex_batteriesexpert_fr-fr_1539747393537/ProductSearch/_search
{
  "_source": [
    "id",
    "matchProductFinder.keys", 
    "matchProductFinder.optionProductFinder.name",
    "matchProductFinder.optionProductFinder.level",
    "matchProductFinderKeywords"
    ],
    
  "query": 
  {
    "bool": {
      "must": [
        {
          "nested": {
            "path": "matchProductFinder",
            "query": 
            {
              "nested": {
                "path": "matchProductFinder.optionProductFinder",
                "query": {
                    
                      "bool": 
                      {
                        "must": 
                        [
                          {
                            "match": 
                            {
                              "matchProductFinder.optionProductFinder.name": "Automobiles et Camionettes"
                            }
                          },
                          {
                            "match": 
                            {
                              "matchProductFinder.optionProductFinder.level": 1
                            }
                          }
                        ]
                      } 
                      
                    }
                  
                  
                
              } 
              
            }
          }
        }
        
      ]
    }
  }
  
}



GET develop_productindex_batteriesexpert_fr-fr_1539747393537/ProductSearch/_search
{
  "_source": [
    "id",
    "matchProductFinder.keys", 
    "matchProductFinder.optionProductFinder.name",
    "matchProductFinder.optionProductFinder.level",
    "matchProductFinderKeywords"
    ], 
  "query": {
    "bool": {
      
      "filter": [
        {
          
          "bool": 
          {
            "must": 
            [
              {
                "nested": 
                {
                  "query": {
                    "bool": {
                      "must":
                        [{
                        "nested": {
                        "query": {
                    "bool": {
                      "must":
                      [
                        
                        {
                          "match": {
                            "matchProductFinder.optionProductFinder.name": "Automobiles et Camionettes"
                          }
                        },
                        {
                          "match": {
                            "matchProductFinder.optionProductFinder.level": 1
                          }
                        }
                      ]
                      
                    }},
                        "path": "matchProductFinder.optionProductFinder"
                          
                        }}
                      ]  
                      
                    }
                  },
                  "path": "matchProductFinder"
                }
              },
              
              {
                "nested": 
                {
                  "query": {
                    "bool": {
                      "must":
                        [{
                        "nested": {
                        "query": {
                    "bool": {
                      "must":
                      [
                        
                        {
                          "match": {
                            "matchProductFinder.optionProductFinder.name": "2013"
                          }
                        },
                        {
                          "match": {
                            "matchProductFinder.optionProductFinder.level": 2
                          }
                        }
                      ]
                      
                    }},
                        "path": "matchProductFinder.optionProductFinder"
                          
                        }}
                      ]  
                      
                    }
                  },
                  "path": "matchProductFinder"
                }
              }
              
            ]
          }
        }
      ]
    }
  }
}



GET develop_productindex_batteriesexpert_fr-fr_1539747393537/ProductSearch/_search
{
  "_source": [
    "id",
    "matchProductFinder.keys", 
    "matchProductFinder.optionProductFinder.name",
    "matchProductFinder.optionProductFinder.level",
    "matchProductFinderKeywords"
    ], 
  "query": {
    "bool": {
      
      "filter": [
        {
          
          "bool": 
          {
            "must": 
            [
              {
                "nested": 
                {
                  "query": {
                    "bool": {
                      "must":
                        [{
                        "nested": {
                        "query": {
                    "bool": {
                      "must":
                      [
                        
                        {
                          "match": {
                            "matchProductFinder.optionProductFinder.name": "Automobiles et Camionettes"
                          }
                        },
                        {
                          "match": {
                            "matchProductFinder.optionProductFinder.level": 1
                          }
                        }
                      ]
                      
                    }},
                        "path": "matchProductFinder.optionProductFinder"
                          
                        }}
                      ]  
                      
                    }
                  },
                  "path": "matchProductFinder"
                }
              },
              
              {
                "nested": 
                {
                  "query": {
                    "bool": {
                      "must":
                        [{
                        "nested": {
                        "query": {
                    "bool": {
                      "must":
                      [
                        
                        {
                          "match": {
                            "matchProductFinder.optionProductFinder.name": "2013"
                          }
                        },
                        {
                          "match": {
                            "matchProductFinder.optionProductFinder.level": 2
                          }
                        }
                      ]
                      
                    }},
                        "path": "matchProductFinder.optionProductFinder"
                          
                        }}
                      ]  
                      
                    }
                  },
                  "path": "matchProductFinder"
                }
              }
            ]
          }
        }
      ]
    }
  }
}



GET _cat/indices

GET checking_ind/ProductSearch/_count

GET productindex_batteriesexpert_en-us_1538619846227/ProductSearch/_count



# mappings
GET productindex_batteriesexpert_en-us_1539228143767/_mappings

GET productindex_batteriesexpert_en-us_1538619846227/_mappings

GET backup_productindex_batteriesexpert_en-us/_count

# product desctiption field mappings
GET productindex_batteriesexpert_en-us_1538619846227/_mapping/ProductSearch/field/product.b2bBrands.imagePath



# test analyzer
GET product_with_old_settings/_analyze
{
  "analyzer" : "edge_ngram_analyzer",
  "text" : "sf-2001"
}

GET _settings


GET checking_ind_whitespace/_analyze
{
  "analyzer" : "standard",
  "text" : "sf-2001"
}

GET _analyze
{
  "analyzer" : "default",
  "text" : "sf-2001"
}


GET productindex_batteriesexpert_en-us_1538619846227/_mapping/ProductSearch/field/product.details.image,product.b2bBrands.externalUrl

# remove field noice 
GET productindex_batteriesexpert_en-us_1538619846227/ProductSearch/_search
{
  "_source": ["id", 
  "product.id", 
  "product.description", 
  "product.description.ngrams", 
  "product.description.raw", 
  "product.description.shingles",
  "product.description.synonyms",
  "product.details.id", 
  "product.details.description", 
  "product.details.image", 
  "product.metaDescription", 
  "product.metaKeywords", 
  "product.itemCode", 
  "product.itemCodeFormatted" ,  
  "product.metaDescription.ngrams", 
  "product.metaDescription.shingles",
  "product.metaDescription.synonyms",
  "product.metaKeywords.ngrams",
  "product.metaKeywords.shingles",
  "product.metaKeywords.synonyms",
  "product.b2bBrands.name",
  "product.b2bBrands.name.ngrams",
  "product.b2bBrands.name.shingles",
  "product.b2bBrands.name.synonyms",
  "product.hasB2bCategories",
  "product.hasB2cCategories",
  "product.b2bBrands.externalUrl"
  ], 
  "query":
  {
  "bool" : {
    "must" : [
      {
        "bool" : {
          "should" : [
            {
              "nested" : {
                "query" : {
                  "bool" : {
                    "should" : [
                      
                      {
                        "match" : {
                          "product.description.ngrams" : {
                            "query" : "sf 2001",
                            "operator" : "and",
                            "prefix_length" : 0,
                            "max_expansions" : 50,
                            "fuzzy_transpositions" : true,
                            "lenient" : false,
                            "zero_terms_query" : "NONE",
                            "boost" : 10.0
                          }
                        }
                      }
                    ],
                    "disable_coord" : false,
                    "adjust_pure_negative" : true,
                    "boost" : 1.0
                  }
                },
                "path" : "product",
                "ignore_unmapped" : false,
                "score_mode" : "sum",
                "boost" : 1.0
              }
            }
          ],
          "disable_coord" : false,
          "adjust_pure_negative" : true,
          "boost" : 1.0
        }
      }
    ],
    "disable_coord" : false,
    "adjust_pure_negative" : true,
    "boost" : 1.0
  }
}
}




GET _analyze
{
  "analyzer" : "standard",
  "text" : "sf-2001"
}

GET checking_ind_standard/_analyze
{
  "analyzer" : "itemcode_analyzer",
  "text" : "sf-2001"
}

GET _analyze
{
  "analyzer" : "default",
  "text" : "sf-2001"
}



GET productindex_batteriesexpert_en-us_1538965885491/_mapping/field/product.description,matchProductFinder.keys,matchProductFinder.optionProductFinder.name,matchProductFinder.optionProductFinder.level?include_defaults=true

GET develop_productindex_batteriesexpert_fr-fr_1539747393537/_analyze
{
  "analyzer": "prefix_analyzer",
  "text": ["1ddf0b617b92733d5369e7cc626d2f4bf8a0b2e3c&2a68b8351560179aac558c46820cb57b9d16da7bf&37b9d5efbcfeb5fe1dc3720f73deb1700ec03eca5&42815f6b98b7a1fc00fc6bbb6d86583c410d86af7&5b40169426d1b019afe2aff41394a39b2ff8e4f0a&"]
}


GET _analyze
{
  "analyzer": "prefix_analyzer",
  "text": ["1ddf0b617b92733d5369e7cc626d2f4bf8a0b2e3c&2a68b8351560179aac558c46820cb57b9d16da7bf&37b9d5efbcfeb5fe1dc3720f73deb1700ec03eca5&42815f6b98b7a1fc00fc6bbb6d86583c410d86af7&5b40169426d1b019afe2aff41394a39b2ff8e4f0a&"]
}


GET develop_productindex_batteriesexpert_fr-fr_1539747393537/_settings





PUT my_index
{
  "mappings": {
    "session": {
      "properties": {
        "user_id": {
          "type":  "keyword"
        },
        "last_updated": {
          "type": "date"
        },
        "session_data": { 
          "enabled": false
        }
      }
    }
  }
}




PUT my_index/session/session_1
{
  "user_id": "kimchy",
  "session_data":  "foo",
  "last_updated": "2015-12-06T18:20:22"
}

GET my_index/session/session_1

GET my_index/session/_search
{
  "query": {"match": 
  {
    "": "kimchy"
  }}
}



PUT my_index
{
  "mappings": {
    "doc": {
      "properties": {
        "title": {
          "type": "text",
          "store": true 
        },
        "date": {
          "type": "date",
          "store": true 
        },
        "content": {
          "type": "text",
          "store": false
        }
      }
    }
  }
}

DELETE my_index

PUT my_index/doc/1
{
  "title":   "Some short title",
  "date":    "2015-01-01",
  "content": "A very long content field..."
}

GET my_index/doc/_mapping

GET my_index/doc/_search
{
  "query": {"match": {
    "content": "very"
  }}
}

GET _cat/indices

GET productindex_batteriesexpert_en-us_1539228143767/ProductSearch/_mapping

GET productindex_batteriesexpert_en-us_1539228143767/ProductSearch/1011115016


GET productindex_batteriesexpert_en-us_1539228143767/ProductSearch/_search
{
  "_source": ["product.b2bCategories.visibleTags"
  , "product.b2bCategories.hiddenTags"
  ]

}

GET develop_productindex_batteriesexpert_fr-fr_1539747393537/_mapping/ProductSearch/field/matchProductFinder.optionProductFinder.name,matchProductFinder.optionProductFinder.level?include_defaults=true

GET _cat/indices


# updated
GET develop_productindex_batteriesexpert_fr-fr/ProductSearch/_search
{
  "_source": [
    "id",
    "matchProductFinder.keys", 
    "matchProductFinder.optionProductFinder.name",
    "matchProductFinder.optionProductFinder.level"
  ],
  
  "query": {
  "bool": {
    "filter": [
      {
        "bool": {
          "must": [
            {
              "nested" : 
              {
                "path": "matchProductFinder",
                "query" : 
                {
                  "bool" : 
                  {
                    "must" : 
                    [
                      {
                        "query_string": {
                "default_field": "matchProductFinder.keys",
                "query": "1ddf0b617b92733d5369e7cc626d2f4bf8a0b2e3c&2a68b8351560179aac558c46820cb57b9d16da7bf&37b9d5efbcfeb5fe1dc3720f73deb1700ec03eca5&42815f6b98b7a1fc00fc6bbb6d86583c410d86af7", 
                "minimum_should_match": "100%"
              
            }
                      }
                    ]
                  }
                }
              }
              
            }
          ],
          "disable_coord": false,
          "adjust_pure_negative": true,
          "boost": 1
        }
      },
      {
        "bool": {
          "must": [
            {
              "nested": {
                "query": {
                  "bool": {
                    "should": [
                      {
                        "match": {
                          "product.hasB2cCategories": {
                            "query": true,
                            "operator": "OR",
                            "prefix_length": 0,
                            "max_expansions": 50,
                            "fuzzy_transpositions": true,
                            "lenient": false,
                            "zero_terms_query": "NONE",
                            "boost": 1
                          }
                        }
                      },
                      {
                        "match": {
                          "product.hasB2bCategories": {
                            "query": true,
                            "operator": "OR",
                            "prefix_length": 0,
                            "max_expansions": 50,
                            "fuzzy_transpositions": true,
                            "lenient": false,
                            "zero_terms_query": "NONE",
                            "boost": 1
                          }
                        }
                      }
                    ],
                    "disable_coord": false,
                    "adjust_pure_negative": true,
                    "boost": 1
                  }
                },
                "path": "product",
                "ignore_unmapped": false,
                "score_mode": "avg",
                "boost": 1
              }
            }
          ],
          "disable_coord": false,
          "adjust_pure_negative": true,
          "boost": 1
        }
      }
    ],
    "disable_coord": false,
    "adjust_pure_negative": true,
    "boost": 1
  }
}}


GET develop_productindex_batteriesexpert_fr-fr/ProductSearch/1010115025


GET develop_productindex_batteriesexpert_fr-fr/ProductSearch/_search
{
  "_source": [
    "id"
    ],
  
  "query": {
  "bool": {
    "filter": [
      {
        "bool": {
          "must": [
            {
              "nested" : 
              {
                "path": "matchProductFinder",
                "query" : 
                {
                  "bool" : 
                  {
                    "must" : 
                    [
                      {
                        "query_string": {
                "default_field": "matchProductFinder.keysOriginal",
                "query": "Automobiles-et-Camionettes_2013_Hyundai_Accent", 
                "minimum_should_match": "100%"
              
            }
                      }
                    ]
                  }
                }
              }
              
            }
          ],
          "disable_coord": false,
          "adjust_pure_negative": true,
          "boost": 1
        }
      }
    ],
    "disable_coord": false,
    "adjust_pure_negative": true,
    "boost": 1
  }
}} 



GET develop_productindex_batteriesexpert_fr-fr_1539747393537/_mapping/ProductSearch/field/matchProductFinder.optionProductFinder.name,matchProductFinder.optionProductFinder.level





GET develop_productindex_batteriesexpert_fr-fr_1539747393537/_mapping/ProductSearch

GET develop_productindex_batteriesexpert_fr-fr_1539747393537/ProductSearch/_search
{
  "_source": [
    "id",
    "matchProductFinder.optionProductFinder.name",
    "matchProductFinder.optionProductFinder.level"
    ], 
  "query": {
    "bool": {
      "filter": [
        {
          
          "bool": {
            "must": [
              {
                "nested": {
                  "query": {
                    "bool": {
                      "must": [
                        {
                          "match": {
                            "matchProductFinder.optionProductFinder.name": "2013"
                          }
                        },
                        {
                          "match": {
                            "matchProductFinder.optionProductFinder.level": 2
                          }
                        }
                      ]
                    }
                  },
                  "path": "matchProductFinder.optionProductFinder"
                }
              }
            ]
          }
        }
      ]
    }
  }
}




######



GET develop_productindex_batteriesexpert_fr-fr_1539747393537/ProductSearch/_search



GET develop_productindex_batteriesexpert_fr-fr_1539747393537/ProductSearch/_search
{
  "from": 7,
  "size": 10, 
  "_source": [
    "product.id",
    "matchProductFinder.optionProductFinder.name",
    "matchProductFinder.optionProductFinder.level"
  ],
  "query": {
    "bool": {
      "filter": [
        {
          
          "bool": {
            "must": [
              
              {
                "nested": {
                  "query": {
                    "bool": {
                      "must": [
                        {
                          "match": {
                            "matchProductFinder.optionProductFinder.name": "Automobiles et Camionettes"
                          }
                        },
                        {
                          "match": {
                            "matchProductFinder.optionProductFinder.level": 1
                          }
                        }
                      ]
                    }
                  },
                  "path": "matchProductFinder.optionProductFinder"
                }
              }
              ,
              {
                "nested": {
                  "query": {
                    "bool": {
                      "must": [
                        {
                          "match": {
                            "matchProductFinder.optionProductFinder.name": {
                              "query": "2013",
                              "operator": "OR",
                              "prefix_length": 0,
                              "max_expansions": 50,
                              "fuzzy_transpositions": true,
                              "lenient": false,
                              "zero_terms_query": "NONE",
                              "boost": 1
                            }
                          }
                        },
                        {
                          "match": {
                            "matchProductFinder.optionProductFinder.level": {
                              "query": 2,
                              "operator": "OR",
                              "prefix_length": 0,
                              "max_expansions": 50,
                              "fuzzy_transpositions": true,
                              "lenient": false,
                              "zero_terms_query": "NONE",
                              "boost": 1
                            }
                          }
                        }
                      ],
                      "disable_coord": false,
                      "adjust_pure_negative": true,
                      "boost": 1
                    }
                  },
                  "path": "matchProductFinder.optionProductFinder",
                  "ignore_unmapped": false,
                  "score_mode": "avg",
                  "boost": 1
                }
              }
            ],
            "disable_coord": false,
            "adjust_pure_negative": true,
            "boost": 1
          }
        }
      ],
      "disable_coord": false,
      "adjust_pure_negative": true,
      "boost": 1
    }
  }
}



GET develop_productindex_batteriesexpert_fr-fr_1539747393537/ProductSearch/_search
{
  "_source": [
    "product.id",
    "matchProductFinder.keys", 
    "matchProductFinder.optionProductFinder.name",
    "matchProductFinder.optionProductFinder.level"
  ],
  "query": {
    "bool": {
      "filter": [
        {
          "bool": {
            "must": [
              
              {
                "nested": {
                  "query": {
                    "bool": {
                      "must":
                      [
                        {
                          "match": 
                          {
                            "matchProductFinder.optionProductFinder.name": "Automobiles et Camionettes"
                          }
                        },
                        {
                          "match": 
                          {
                            "matchProductFinder.optionProductFinder.level": 1
                          }
                        }
                      ]
                    }
                  },
                  "path": "matchProductFinder.optionProductFinder"
                }
              }
              ,
              {
                "nested": {
                  "query": {
                    "bool": {
                      "must": [
                        {
                          "match": {
                            "matchProductFinder.optionProductFinder.name": {
                              "query": "2013",
                              "operator": "OR",
                              "prefix_length": 0,
                              "max_expansions": 50,
                              "fuzzy_transpositions": true,
                              "lenient": false,
                              "zero_terms_query": "NONE",
                              "boost": 1
                            }
                          }
                        },
                        {
                          "match": {
                            "matchProductFinder.optionProductFinder.level": {
                              "query": 2,
                              "operator": "OR",
                              "prefix_length": 0,
                              "max_expansions": 50,
                              "fuzzy_transpositions": true,
                              "lenient": false,
                              "zero_terms_query": "NONE",
                              "boost": 1
                            }
                          }
                        }
                      ],
                      "disable_coord": false,
                      "adjust_pure_negative": true,
                      "boost": 1
                    }
                  },
                  "path": "matchProductFinder.optionProductFinder",
                  "ignore_unmapped": false,
                  "score_mode": "avg",
                  "boost": 1
                }
              }
            ],
            "disable_coord": false,
            "adjust_pure_negative": true,
            "boost": 1
          }
        }
      ],
      "disable_coord": false,
      "adjust_pure_negative": true,
      "boost": 1
    }
  }
}


DELETE /nested_test


PUT /nested_test
{
  "mappings": {
    "t": {
      "properties": {
        "categories": {
          "type": "nested",
          "properties": {
            "name": {
              "type": "text"
            },
            "list": {
              "type": "nested",
              "properties": {
                "url_site": {
                  "type": "text"
                },
                "persons": {
                  "type": "nested",
                  "properties": {
                    "total_customers": {
                      "type": "integer"
                    },
                    "total_subscribers": {
                      "type": "integer"
                    },
                    "c_details": 
                    {
                      "properties": {
                        "person_id": {
                          "type": "text"
                        },
                        "person_val": {
                          "type": "text"
                        }
                      }
                    }
                    ,
                    "details": {
                      "type": "nested",
                      "properties": {
                        "person_id": {
                          "type": "text"
                        },
                        "person_val": {
                          "type": "text"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

GET nested_test/_mapping/t

GET develop_productindex_batteriesexpert_fr-fr_1539747393537/_mapping/ProductSearch


PUT /nested_test/t/1
{
  "categories" : {
    "name" : "cat1",
    "list" : {
      "url_site" : "www.bla.org",
      "persons" : {
        "total_customers" : 10,
        "total_subscribers" : 10,
        "details" : 
        [{
          "person_id" : 1,
          "person_val" : "test1"
        }],
        "c_details" : 
        [{
          "person_id" : 1,
          "person_val" : "test1"
        }]
      }
    }
  }
}

PUT /nested_test/t/2
{
  "categories" : {
    "name" : "cat2",
    "list" : {
      "url_site" : "www.bleep.org",
      "persons" : {
        "total_customers" : 10,
        "total_subscribers" : 10,
        "details" : 
        [{
          "person_id" : 2,
          "person_val" : "test2"
        }],
        "c_details" : 
        [{
          "person_id" : 2,
          "person_val" : "test2"
        }]
      }
    }
  }
}

PUT /nested_test/t/3
{
  "categories" : {
    "name" : "cat3",
    "list" : {
      "url_site" : "www.blubb.org",
      "persons" : {
        "total_customers" : 10,
        "total_subscribers" : 10,
        "details" : [{
          "person_id" : 3,
          "person_val" : "test3"
        }],
        "c_details" :[ {
          "person_id" : 3,
          "person_val" : "test3"
        }]
      }
    }
  }
}


PUT /nested_test/t/4
{
  "categories" : {
    "name" : "cat4",
    "list" : {
      "url_site" : "www.bla.org",
      "persons" : {
        "total_customers" : 10,
        "total_subscribers" : 10,
        "details" : [ {
          "person_id" : 1,
          "person_val" : "test5"
        }
        ,
        {
          "person_id" : 4,
          "person_val" : "test4"
        }
        ],
        "c_details" : [ {
          "person_id" : 1,
          "person_val" : "test5"
        }
        ,
        {
          "person_id" : 4,
          "person_val" : "test4"
        }
        ]
      }
    }
  }
}



PUT /nested_test/t/5
{
  "categories" : {
    "name" : "cat5",
    "list" : {
      "url_site" : "www.bla.org",
      "persons" : {
        "total_customers" : 10,
        "total_subscribers" : 10,
        "details" : [ {
          "person_id" : 1,
          "person_val" : "test1"
        }
        ,
        {
          "person_id" : 2,
          "person_val" : "test2"
        }
        ,
        {
          "person_id" : 3,
          "person_val" : "test3"
        }
        ],
        "c_details" : 
        [ {
          "person_id" : 1,
          "person_val" : "test5"
        }
        ,
        {
          "person_id" : 2,
          "person_val" : "test2"
        }
        ,
        {
          "person_id" : 3,
          "person_val" : "test3"
        }
        ]
      }
    }
  }
}



GET /nested_test/t/_search
{
  "query": {
    "nested": {
      "path": "categories",
      "query": {
        "nested": {
          "path": "categories.list",
          "query": {
             
            "nested": {
              "path": "categories.list.persons",
              "query": {
                
                
                "nested": {
                  "path": "categories.list.persons.details",
                  "query": 
                  {
                    "bool": 
                    {
                      "must": 
                      [
                        {
                          "match": {
                            "categories.list.persons.details.person_id": 1
                          }
                        },
                        {
                          "match": {
                            "categories.list.persons.details.person_val": "test5"
                          }
                        }
                      ]
                    }
                  }
                } 
                 
                
              }
            }
          }
        }
      }
    }
  }
}


GET /nested_test/t/_search
{
  "query": {
    "nested": {
      "path": "categories",
      "query": {
        "nested": {
          "path": "categories.list",
          "query": {
             
            "nested": {
              "path": "categories.list.persons",
              "query": {
                "bool": {
                  "must": [
                    {
                      "match": {
                        "categories.list.persons.c_details.person_id": "1"
                      }
                    },
                    {
                      "match": {
                        "categories.list.persons.c_details.person_val": "test1"
                      }
                    },
                    
                    {
                      "nested": {
                  "path": "categories.list.persons.details",
                  "query": 
                  {
                    "bool": 
                    {
                      "must": 
                      [
                        {
                          "match": {
                            "categories.list.persons.details.person_id": 1
                          }
                        },
                        {
                          "match": {
                            "categories.list.persons.details.person_val": "test1"
                          }
                        }
                      ]
                    }
                  }
                }
                    }
                  ]
                } 
                
                 
                 
                
              }
            }
          }
        }
      }
    }
  }
}






GET /nested_test/t/_search
{
  "query": {
    "nested": {
      "path": "categories",
      "query": {
        "nested": {
          "path": "categories.list",
          "query": {
            "nested": {
              "path": "categories.list.persons",
              "query": {
                "bool": 
                {
                  "must": 
                  [
                    {
                      "match": 
                      {
                        "categories.list.persons.c_details.person_id": "1"
                      }
                    },
                    {
                      "match": 
                      {
                        "categories.list.persons.c_details.person_val": "test2"
                      }
                    }
                  ]
                }
              }
            }
          }
        }
      }
    }
  }
}


"bool": {
              "must": [
                {
                  "match": {
                    "categories.list.persons.c_details.person_id": "1"
                  }
                },
                {
                  "match": {
                    "categories.list.persons.c_details.person_val": "test5"
                  }
                }
              ]
            }

GET /nested_test/t/_search
{
  "query": {
    "nested": {
      "path": "categories",
      "query": {
        "nested": {
          "path": "categories.list",
          "query": {
            "nested": {
              "path": "categories.list.persons.details",
              "query": {
                "dis_max": {
                  "queries": 
                  [
                    {
                      "match": {
                        "categories.list.persons.details.person_id": 1
                      }
                    },
                    {
                      "match": {
                        "categories.list.persons.details.person_val": "test5"
                      }
                    }
                    
                  ]
                }
              }
            }
          }
        }
      }
    }
  }
}


GET develop_productindex_batteriesexpert_fr-fr_1539747393537/ProductSearch/_search
{
  "query": 
  {
  "bool" : {
    "filter" : [
      {
        "bool" : {
          "must" : [
            {
              "nested" : {
                "query" : {
                  "bool" : {
                    "should" : [
                      {
                        "match" : {
                          "product.hasB2cCategories" : {
                            "query" : true,
                            "operator" : "OR",
                            "prefix_length" : 0,
                            "max_expansions" : 50,
                            "fuzzy_transpositions" : true,
                            "lenient" : false,
                            "zero_terms_query" : "NONE",
                            "boost" : 1.0
                          }
                        }
                      },
                      {
                        "match" : {
                          "product.hasB2bCategories" : {
                            "query" : true,
                            "operator" : "OR",
                            "prefix_length" : 0,
                            "max_expansions" : 50,
                            "fuzzy_transpositions" : true,
                            "lenient" : false,
                            "zero_terms_query" : "NONE",
                            "boost" : 1.0
                          }
                        }
                      }
                    ],
                    "disable_coord" : false,
                    "adjust_pure_negative" : true,
                    "boost" : 1.0
                  }
                },
                "path" : "product",
                "ignore_unmapped" : false,
                "score_mode" : "avg",
                "boost" : 1.0
              }
            }
          ],
          "disable_coord" : false,
          "adjust_pure_negative" : true,
          "boost" : 1.0
        }
      }
    ],
    "disable_coord" : false,
    "adjust_pure_negative" : true,
    "boost" : 1.0
  }
}
}


GET develop_productindex_batteriesexpert_fr-fr_1539747393537/_mapping/ProductSearch

GET develop_productindex_batteriesexpert_fr-fr_1539747393537/_analyze
{
  "analyzer": "prefix_analyzer",
  "text": ["1ddf0b617b92733d5369e7cc626d2f4bf8a0b2e3c&2a68b8351560179aac558c46820cb57b9d16da7bf&37b9d5efbcfeb5fe1dc3720f73deb1700ec03eca5&42815f6b98b7a1fc00fc6bbb6d86583c410d86af7&5b40169426d1b019afe2aff41394a39b2ff8e4f0a&"]
}


# full
GET develop_productindex_batteriesexpert_fr-fr_1539747393537/ProductSearch/_search
{
  "_source": ["id","matchProductFinder.optionProductFinder.name", "matchProductFinder.optionProductFinder.level", "matchProductFinder.keys", "matchProductFinder.keys.prefix"], 
  "query": 
  {
  "bool" : {
    "filter" : [
      {
        "bool" : {
          "must" : [
            {
              "nested" : {
                "query" : {
                  "bool" : {
                    "must" : [
                      {
                        "match" : {
                          "matchProductFinder.optionProductFinder.name" : {
                            "query" : "Automobiles et Camionettes",
                            "operator" : "OR",
                            "prefix_length" : 0,
                            "max_expansions" : 50,
                            "fuzzy_transpositions" : true,
                            "lenient" : false,
                            "zero_terms_query" : "NONE",
                            "boost" : 1.0
                          }
                        }
                      },
                      {
                        "match" : {
                          "matchProductFinder.optionProductFinder.level" : {
                            "query" : 1,
                            "operator" : "OR",
                            "prefix_length" : 0,
                            "max_expansions" : 50,
                            "fuzzy_transpositions" : true,
                            "lenient" : false,
                            "zero_terms_query" : "NONE",
                            "boost" : 1.0
                          }
                        }
                      }
                    ],
                    "disable_coord" : false,
                    "adjust_pure_negative" : true,
                    "boost" : 1.0
                  }
                },
                "path" : "matchProductFinder.optionProductFinder",
                "ignore_unmapped" : false,
                "score_mode" : "avg",
                "boost" : 1.0
              }
            },
            {
              "nested" : {
                "query" : {
                  "bool" : {
                    "must" : [
                      {
                        "match" : {
                          "matchProductFinder.optionProductFinder.name" : {
                            "query" : "2013",
                            "operator" : "OR",
                            "prefix_length" : 0,
                            "max_expansions" : 50,
                            "fuzzy_transpositions" : true,
                            "lenient" : false,
                            "zero_terms_query" : "NONE",
                            "boost" : 1.0
                          }
                        }
                      },
                      {
                        "match" : {
                          "matchProductFinder.optionProductFinder.level" : {
                            "query" : 2,
                            "operator" : "OR",
                            "prefix_length" : 0,
                            "max_expansions" : 50,
                            "fuzzy_transpositions" : true,
                            "lenient" : false,
                            "zero_terms_query" : "NONE",
                            "boost" : 1.0
                          }
                        }
                      }
                    ],
                    "disable_coord" : false,
                    "adjust_pure_negative" : true,
                    "boost" : 1.0
                  }
                },
                "path" : "matchProductFinder.optionProductFinder",
                "ignore_unmapped" : false,
                "score_mode" : "avg",
                "boost" : 1.0
              }
            },
            {
              "nested" : {
                "query" : {
                  "bool" : {
                    "must" : [
                      {
                        "match" : {
                          "matchProductFinder.optionProductFinder.name" : {
                            "query" : "Hyundai",
                            "operator" : "OR",
                            "prefix_length" : 0,
                            "max_expansions" : 50,
                            "fuzzy_transpositions" : true,
                            "lenient" : false,
                            "zero_terms_query" : "NONE",
                            "boost" : 1.0
                          }
                        }
                      },
                      {
                        "match" : {
                          "matchProductFinder.optionProductFinder.level" : {
                            "query" : 3,
                            "operator" : "OR",
                            "prefix_length" : 0,
                            "max_expansions" : 50,
                            "fuzzy_transpositions" : true,
                            "lenient" : false,
                            "zero_terms_query" : "NONE",
                            "boost" : 1.0
                          }
                        }
                      }
                    ],
                    "disable_coord" : false,
                    "adjust_pure_negative" : true,
                    "boost" : 1.0
                  }
                },
                "path" : "matchProductFinder.optionProductFinder",
                "ignore_unmapped" : false,
                "score_mode" : "avg",
                "boost" : 1.0
              }
            },
            {
              "nested" : {
                "query" : {
                  "bool" : {
                    "must" : [
                      {
                        "match" : {
                          "matchProductFinder.optionProductFinder.name" : {
                            "query" : "Accent",
                            "operator" : "OR",
                            "prefix_length" : 0,
                            "max_expansions" : 50,
                            "fuzzy_transpositions" : true,
                            "lenient" : false,
                            "zero_terms_query" : "NONE",
                            "boost" : 1.0
                          }
                        }
                      },
                      {
                        "match" : {
                          "matchProductFinder.optionProductFinder.level" : {
                            "query" : 4,
                            "operator" : "OR",
                            "prefix_length" : 0,
                            "max_expansions" : 50,
                            "fuzzy_transpositions" : true,
                            "lenient" : false,
                            "zero_terms_query" : "NONE",
                            "boost" : 1.0
                          }
                        }
                      }
                    ],
                    "disable_coord" : false,
                    "adjust_pure_negative" : true,
                    "boost" : 1.0
                  }
                },
                "path" : "matchProductFinder.optionProductFinder",
                "ignore_unmapped" : false,
                "score_mode" : "avg",
                "boost" : 1.0
              }
            }
          ],
          "disable_coord" : false,
          "adjust_pure_negative" : true,
          "boost" : 1.0
        }
      },
      {
        "bool" : {
          "must" : [
            {
              "nested" : {
                "query" : {
                  "bool" : {
                    "should" : [
                      {
                        "match" : {
                          "product.hasB2cCategories" : {
                            "query" : true,
                            "operator" : "OR",
                            "prefix_length" : 0,
                            "max_expansions" : 50,
                            "fuzzy_transpositions" : true,
                            "lenient" : false,
                            "zero_terms_query" : "NONE",
                            "boost" : 1.0
                          }
                        }
                      },
                      {
                        "match" : {
                          "product.hasB2bCategories" : {
                            "query" : true,
                            "operator" : "OR",
                            "prefix_length" : 0,
                            "max_expansions" : 50,
                            "fuzzy_transpositions" : true,
                            "lenient" : false,
                            "zero_terms_query" : "NONE",
                            "boost" : 1.0
                          }
                        }
                      }
                    ],
                    "disable_coord" : false,
                    "adjust_pure_negative" : true,
                    "boost" : 1.0
                  }
                },
                "path" : "product",
                "ignore_unmapped" : false,
                "score_mode" : "avg",
                "boost" : 1.0
              }
            }
          ],
          "disable_coord" : false,
          "adjust_pure_negative" : true,
          "boost" : 1.0
        }
      }
    ],
    "disable_coord" : false,
    "adjust_pure_negative" : true,
    "boost" : 1.0
  }
}
}




GET develop_productindex_batteriesexpert_fr-fr/ProductSearch/_search
{
  "_source": ["id", "matchProductFinder.keys", "matchProductFinder.optionProductFinder.level", "matchProductFinder.optionProductFinder.name"], 
  "size": 0, 
  "query":{
  "bool" : {
    "filter" : [
      {
        "bool" : {
          "must" : [
            {
              "nested" : {
                "query" : {
                  "bool" : {
                    "should" : [
                      {
                        "match" : {
                          "product.hasB2cCategories" : {
                            "query" : true,
                            "operator" : "OR",
                            "prefix_length" : 0,
                            "max_expansions" : 50,
                            "fuzzy_transpositions" : true,
                            "lenient" : false,
                            "zero_terms_query" : "NONE",
                            "boost" : 1.0
                          }
                        }
                      },
                      {
                        "match" : {
                          "product.hasB2bCategories" : {
                            "query" : true,
                            "operator" : "OR",
                            "prefix_length" : 0,
                            "max_expansions" : 50,
                            "fuzzy_transpositions" : true,
                            "lenient" : false,
                            "zero_terms_query" : "NONE",
                            "boost" : 1.0
                          }
                        }
                      }
                    ],
                    "disable_coord" : false,
                    "adjust_pure_negative" : true,
                    "boost" : 1.0
                  }
                },
                "path" : "product",
                "ignore_unmapped" : false,
                "score_mode" : "avg",
                "boost" : 1.0
              }
            }
          ],
          "disable_coord" : false,
          "adjust_pure_negative" : true,
          "boost" : 1.0
        }
      }
    ],
    "disable_coord" : false,
    "adjust_pure_negative" : true,
    "boost" : 1.0
  }
},
  "aggregations": {
    "matchProductFinder":{
      "nested": {
        "path": "matchProductFinder"
      },
      "aggs":{
        "optionLevelFilter-4" : {
          "filter" : {
            "bool" : {
              "must" : [
                {
                  "nested" : {
                    "path" : "matchProductFinder",
                    "query" : {
                      "bool" : {
                        "must" : [
                          {
                            "query_string" : {
                              "query" : "1ddf0b617b92733d5369e7cc626d2f4bf8a0b2e3c&2d08b10a32612f9d3bc06be41124becfd39536eee&3f496efcf1e057428e16ff3f09a21776bf42b2749&",
                              "default_field" : "matchProductFinder.keys",
                              "fields" : [ ],
                              "use_dis_max" : true,
                              "tie_breaker" : 0.0,
                              "default_operator" : "or",
                              "auto_generate_phrase_queries" : false,
                              "max_determinized_states" : 10000,
                              "enable_position_increments" : true,
                              "fuzziness" : "AUTO",
                              "fuzzy_prefix_length" : 0,
                              "fuzzy_max_expansions" : 50,
                              "phrase_slop" : 0,
                              "minimum_should_match" : "100%",
                              "escape" : false,
                              "split_on_whitespace" : true,
                              "boost" : 1.0
                            }
                          }
                        ],
                        "disable_coord" : false,
                        "adjust_pure_negative" : true,
                        "boost" : 1.0
                      }
                    },
                    "ignore_unmapped" : false,
                    "score_mode" : "avg",
                    "boost" : 1.0
                  }
                }
              ],
              "disable_coord" : false,
              "adjust_pure_negative" : true,
              "boost" : 1.0
            }
        },
        "aggregations" : {
          "optionProductFinder" : {
            "nested" : {
              "path" : "matchProductFinder.optionProductFinder"
            },
            "aggregations" : {
              "level" : {
                "terms" : {
                  "field" : "matchProductFinder.optionProductFinder.level",
                  "size" : 10,
                  "min_doc_count" : 1,
                  "shard_min_doc_count" : 0,
                  "show_term_doc_count_error" : false,
                  "order" : [
                    {
                      "_count" : "desc"
                    },
                    {
                      "_term" : "asc"
                    }
                  ],
                  "include" : [
                    "4"
                  ]
                },
                "aggregations" : {
                  "name" : {
                    "terms" : {
                      "field" : "matchProductFinder.optionProductFinder.name",
                      "size" : 2147483647,
                      "min_doc_count" : 1,
                      "shard_min_doc_count" : 0,
                      "show_term_doc_count_error" : false,
                      "order" : {
                        "_term" : "asc"
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    }
  }
}

GET develop_productindex_batteriesexpert_fr-fr_1539747393537/ProductSearch/1010115051


GET develop_productindex_batteriesexpert_fr-fr/ProductSearch/_search
{
  "_source": ["id", "matchProductFinder.keys", "matchProductFinder.optionProductFinder.level", "matchProductFinder.optionProductFinder.name"],
  "query": {
    "bool": {
      "filter" : {
      "bool" : {
        "must" : [
          {
            "nested" : {
              "path" : "matchProductFinder",
              "query" : {
                "bool" : {
                  "must" : [
                    {
                      "query_string" : {
                        "query" : "1ddf0b617b92733d5369e7cc626d2f4bf8a0b2e3c&2d08b10a32612f9d3bc06be41124becfd39536eee&3f496efcf1e057428e16ff3f09a21776bf42b2749&",
                        "default_field" : "matchProductFinder.keys",
                        "fields" : [ ],
                        "use_dis_max" : true,
                        "tie_breaker" : 0.0,
                        "default_operator" : "or",
                        "auto_generate_phrase_queries" : false,
                        "max_determinized_states" : 10000,
                        "enable_position_increments" : true,
                        "fuzziness" : "AUTO",
                        "fuzzy_prefix_length" : 0,
                        "fuzzy_max_expansions" : 50,
                        "phrase_slop" : 0,
                        "minimum_should_match" : "100%",
                        "escape" : false,
                        "split_on_whitespace" : true,
                        "boost" : 1.0
                      }
                    }
                  ],
                  "disable_coord" : false,
                  "adjust_pure_negative" : true,
                  "boost" : 1.0
                }
              },
              "ignore_unmapped" : false,
              "score_mode" : "avg",
              "boost" : 1.0
            }
          }
        ],
        "disable_coord" : false,
        "adjust_pure_negative" : true,
        "boost" : 1.0
      }
    }
    }
  }
  
}


GET develop_productindex_batteriesexpert_fr-fr_1539747393537/_settings


GET develop_productindex_batteriesexpert_en-us_1540517613202/_settings

PUT develop_productindex_batteriesexpert_fr-fr/_settings
{
  "index.indexing.slowlog.threshold.index.debug": "0s", 
"index.search.slowlog.threshold.fetch.debug" : "0s", 
"index.search.slowlog.threshold.query.debug": "0s"
}

GET develop_productindex_batteriesexpert_fr-fr/_settings

GET develop_productindex_batteriesexpert_en-us_1540517613202/ProductSearch/_search
{
  "query": {"match_all": {}}
}







# agg
GET develop_productindex_batteriesexpert_fr-fr_1539747393537/ProductSearch/_search
{
  "version": true,
  "from": 0,
  "size": 0,
  "query": {
    "bool": {
      "filter": [
        {
          "bool": {
            "must": [
              {
                "nested": {
                  "query": {
                    "bool": {
                      "should": [
                        {
                          "match": {
                            "product.hasB2cCategories": {
                              "query": true,
                              "operator": "OR",
                              "prefix_length": 0,
                              "max_expansions": 50,
                              "fuzzy_transpositions": true,
                              "lenient": false,
                              "zero_terms_query": "NONE",
                              "boost": 1
                            }
                          }
                        },
                        {
                          "match": {
                            "product.hasB2bCategories": {
                              "query": true,
                              "operator": "OR",
                              "prefix_length": 0,
                              "max_expansions": 50,
                              "fuzzy_transpositions": true,
                              "lenient": false,
                              "zero_terms_query": "NONE",
                              "boost": 1
                            }
                          }
                        }
                      ],
                      "disable_coord": false,
                      "adjust_pure_negative": true,
                      "boost": 1
                    }
                  },
                  "path": "product",
                  "ignore_unmapped": false,
                  "score_mode": "avg",
                  "boost": 1
                }
              }
            ],
            "disable_coord": false,
            "adjust_pure_negative": true,
            "boost": 1
          }
        }
      ],
      "disable_coord": false,
      "adjust_pure_negative": true,
      "boost": 1
    }
  },
  "aggregations": {
    "matchProductFinder": {
      "nested": {
        "path": "matchProductFinder"
      },
      "aggregations": {
        "optionLevelFilter-1": {
          "filter": {
            "bool": {
              "disable_coord": false,
              "adjust_pure_negative": true,
              "boost": 1
            }
          },
          "aggregations": {
            "optionProductFinder": {
              "nested": {
                "path": "matchProductFinder.optionProductFinder"
              },
              "aggregations": {
                "level": {
                  "terms": {
                    "field": "matchProductFinder.optionProductFinder.level",
                    "size": 10,
                    "min_doc_count": 1,
                    "shard_min_doc_count": 0,
                    "show_term_doc_count_error": false,
                    "order": [
                      {
                        "_count": "desc"
                      },
                      {
                        "_term": "asc"
                      }
                    ],
                    "include": [
                      "1"
                    ]
                  },
                  "aggregations": {
                    "name": {
                      "terms": {
                        "field": "matchProductFinder.optionProductFinder.name",
                        "size": 2147483647,
                        "min_doc_count": 1,
                        "shard_min_doc_count": 0,
                        "show_term_doc_count_error": false,
                        "order": {
                          "_term": "asc"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        "optionLevelFilter-2": {
          "filter": {
            "bool": {
              "must": [
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.name": {
                                "query": "Automobiles et Camionettes",
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          },
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.level": {
                                "query": 1,
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder.optionProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                }
              ],
              "disable_coord": false,
              "adjust_pure_negative": true,
              "boost": 1
            }
          },
          "aggregations": {
            "optionProductFinder": {
              "nested": {
                "path": "matchProductFinder.optionProductFinder"
              },
              "aggregations": {
                "level": {
                  "terms": {
                    "field": "matchProductFinder.optionProductFinder.level",
                    "size": 10,
                    "min_doc_count": 1,
                    "shard_min_doc_count": 0,
                    "show_term_doc_count_error": false,
                    "order": [
                      {
                        "_count": "desc"
                      },
                      {
                        "_term": "asc"
                      }
                    ],
                    "include": [
                      "2"
                    ]
                  },
                  "aggregations": {
                    "name": {
                      "terms": {
                        "field": "matchProductFinder.optionProductFinder.name",
                        "size": 2147483647,
                        "min_doc_count": 1,
                        "shard_min_doc_count": 0,
                        "show_term_doc_count_error": false,
                        "order": {
                          "_term": "asc"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        "optionLevelFilter-3": {
          "filter": {
            "bool": {
              "must": [
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.name": {
                                "query": "Automobiles et Camionettes",
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          },
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.level": {
                                "query": 1,
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder.optionProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                },
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.name": {
                                "query": "2013",
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          },
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.level": {
                                "query": 2,
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder.optionProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                }
              ],
              "disable_coord": false,
              "adjust_pure_negative": true,
              "boost": 1
            }
          },
          "aggregations": {
            "optionProductFinder": {
              "nested": {
                "path": "matchProductFinder.optionProductFinder"
              },
              "aggregations": {
                "level": {
                  "terms": {
                    "field": "matchProductFinder.optionProductFinder.level",
                    "size": 10,
                    "min_doc_count": 1,
                    "shard_min_doc_count": 0,
                    "show_term_doc_count_error": false,
                    "order": [
                      {
                        "_count": "desc"
                      },
                      {
                        "_term": "asc"
                      }
                    ],
                    "include": [
                      "3"
                    ]
                  },
                  "aggregations": {
                    "name": {
                      "terms": {
                        "field": "matchProductFinder.optionProductFinder.name",
                        "size": 2147483647,
                        "min_doc_count": 1,
                        "shard_min_doc_count": 0,
                        "show_term_doc_count_error": false,
                        "order": {
                          "_term": "asc"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        "optionLevelFilter-4": {
          "filter": {
            "bool": {
              "must": [
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.name": {
                                "query": "Automobiles et Camionettes",
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          },
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.level": {
                                "query": 1,
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder.optionProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                },
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.name": {
                                "query": "2013",
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          },
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.level": {
                                "query": 2,
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder.optionProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                },
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.name": {
                                "query": "Hyundai",
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          },
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.level": {
                                "query": 3,
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder.optionProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                }
              ],
              "disable_coord": false,
              "adjust_pure_negative": true,
              "boost": 1
            }
          },
          "aggregations": {
            "optionProductFinder": {
              "nested": {
                "path": "matchProductFinder.optionProductFinder"
              },
              "aggregations": {
                "level": {
                  "terms": {
                    "field": "matchProductFinder.optionProductFinder.level",
                    "size": 10,
                    "min_doc_count": 1,
                    "shard_min_doc_count": 0,
                    "show_term_doc_count_error": false,
                    "order": [
                      {
                        "_count": "desc"
                      },
                      {
                        "_term": "asc"
                      }
                    ],
                    "include": [
                      "4"
                    ]
                  },
                  "aggregations": {
                    "name": {
                      "terms": {
                        "field": "matchProductFinder.optionProductFinder.name",
                        "size": 2147483647,
                        "min_doc_count": 1,
                        "shard_min_doc_count": 0,
                        "show_term_doc_count_error": false,
                        "order": {
                          "_term": "asc"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}


GET develop_productindex_batteriesexpert_fr-fr/ProductSearch/_search
{
  "from": 0,
  "size": 0,
  "query": {
    "bool": {
      "filter": [
        {
          "bool": {
            "must": [
              {
                "nested": {
                  "query": {
                    "bool": {
                      "should": [
                        {
                          "match": {
                            "product.hasB2cCategories": {
                              "query": true,
                              "operator": "OR",
                              "prefix_length": 0,
                              "max_expansions": 50,
                              "fuzzy_transpositions": true,
                              "lenient": false,
                              "zero_terms_query": "NONE",
                              "boost": 1
                            }
                          }
                        },
                        {
                          "match": {
                            "product.hasB2bCategories": {
                              "query": true,
                              "operator": "OR",
                              "prefix_length": 0,
                              "max_expansions": 50,
                              "fuzzy_transpositions": true,
                              "lenient": false,
                              "zero_terms_query": "NONE",
                              "boost": 1
                            }
                          }
                        }
                      ],
                      "disable_coord": false,
                      "adjust_pure_negative": true,
                      "boost": 1
                    }
                  },
                  "path": "product",
                  "ignore_unmapped": false,
                  "score_mode": "avg",
                  "boost": 1
                }
              }
            ],
            "disable_coord": false,
            "adjust_pure_negative": true,
            "boost": 1
          }
        }
      ],
      "disable_coord": false,
      "adjust_pure_negative": true,
      "boost": 1
    }
  },
  "version": true,
  "aggregations": {
    "matchProductFinder": {
      "nested": {
        "path": "matchProductFinder"
      },
      "aggregations": {
        "optionLevelFilter-4": {
          "filter": {
            "bool": {
              "must": [
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.name": {
                                "query": "Automobiles et Camionettes",
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          },
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.level": {
                                "query": 1,
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder.optionProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                },
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.name": {
                                "query": "2013",
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          },
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.level": {
                                "query": 2,
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder.optionProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                },
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.name": {
                                "query": "Hyundai",
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          },
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.level": {
                                "query": 3,
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder.optionProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                }
                
              ],
              "disable_coord": false,
              "adjust_pure_negative": true,
              "boost": 1
            }
          },
          "aggregations": {
            "optionProductFinder": {
              "nested": {
                "path": "matchProductFinder.optionProductFinder"
              },
              "aggregations": {
                "level": {
                  "terms": {
                    "field": "matchProductFinder.optionProductFinder.level",
                    "size": 10,
                    "min_doc_count": 1,
                    "shard_min_doc_count": 0,
                    "show_term_doc_count_error": false,
                    "order": [
                      {
                        "_count": "desc"
                      },
                      {
                        "_term": "asc"
                      }
                    ],
                    "include": [
                      "3"
                    ]
                  },
                  "aggregations": {
                    "name": {
                      "terms": {
                        "field": "matchProductFinder.optionProductFinder.name",
                        "size": 2147483647,
                        "min_doc_count": 1,
                        "shard_min_doc_count": 0,
                        "show_term_doc_count_error": false,
                        "order": {
                          "_term": "asc"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}






GET develop_productindex_batteriesexpert_fr-fr_1539747393537/ProductSearch/_search
{
  "from": 0,
  "size": 0,
  "query": {
    "bool": {
      "filter": [
        {
          "bool": {
            "must": [
              {
                "nested": {
                  "query": {
                    "bool": {
                      "should": [
                        {
                          "match": {
                            "product.hasB2cCategories": {
                              "query": true,
                              "operator": "OR",
                              "prefix_length": 0,
                              "max_expansions": 50,
                              "fuzzy_transpositions": true,
                              "lenient": false,
                              "zero_terms_query": "NONE",
                              "boost": 1
                            }
                          }
                        },
                        {
                          "match": {
                            "product.hasB2bCategories": {
                              "query": true,
                              "operator": "OR",
                              "prefix_length": 0,
                              "max_expansions": 50,
                              "fuzzy_transpositions": true,
                              "lenient": false,
                              "zero_terms_query": "NONE",
                              "boost": 1
                            }
                          }
                        }
                      ],
                      "disable_coord": false,
                      "adjust_pure_negative": true,
                      "boost": 1
                    }
                  },
                  "path": "product",
                  "ignore_unmapped": false,
                  "score_mode": "avg",
                  "boost": 1
                }
              }
            ],
            "disable_coord": false,
            "adjust_pure_negative": true,
            "boost": 1
          }
        }
      ],
      "disable_coord": false,
      "adjust_pure_negative": true,
      "boost": 1
    }
  },
  "version": true,
  "aggregations": {
    "matchProductFinder": {
      "nested": {
        "path": "matchProductFinder"
      },
      "aggregations": {
        "optionLevelFilter-4": {
          "filter": {
            "bool": {
              "must": [
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.name": {
                                "query": "Automobiles et Camionettes",
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          },
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.level": {
                                "query": 1,
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder.optionProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                },
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.name": {
                                "query": "2013",
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          },
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.level": {
                                "query": 2,
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder.optionProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                },
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.name": {
                                "query": "Hyundai",
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          },
                          {
                            "match": {
                              "matchProductFinder.optionProductFinder.level": {
                                "query": 3,
                                "operator": "OR",
                                "prefix_length": 0,
                                "max_expansions": 50,
                                "fuzzy_transpositions": true,
                                "lenient": false,
                                "zero_terms_query": "NONE",
                                "boost": 1
                              }
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder.optionProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                }
              ],
              "disable_coord": false,
              "adjust_pure_negative": true,
              "boost": 1
            }
          },
          "aggregations": {
            "optionProductFinder": {
              "nested": {
                "path": "matchProductFinder.optionProductFinder"
              },
              "aggregations": {
                "level": {
                  "terms": {
                    "field": "matchProductFinder.optionProductFinder.level",
                    "size": 10,
                    "min_doc_count": 1,
                    "shard_min_doc_count": 0,
                    "show_term_doc_count_error": false,
                    "order": [
                      {
                        "_count": "desc"
                      },
                      {
                        "_term": "asc"
                      }
                    ],
                    "include": [
                      "4"
                    ]
                  },
                  "aggregations": {
                    "name": {
                      "terms": {
                        "field": "matchProductFinder.optionProductFinder.name",
                        "size": 2147483647,
                        "min_doc_count": 1,
                        "shard_min_doc_count": 0,
                        "show_term_doc_count_error": false,
                        "order": {
                          "_term": "asc"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}


GET develop_productindex_batteriesexpert_fr-fr/ProductSearch/_search
{
  "from": 0,
  "size": 0,
  "query": {
    "bool": {
      "filter": [
        {
          "bool": {
            "must": [
              {
                "nested": {
                  "query": {
                    "bool": {
                      "should": [
                        {
                          "match": {
                            "product.hasB2cCategories": {
                              "query": true,
                              "operator": "OR",
                              "prefix_length": 0,
                              "max_expansions": 50,
                              "fuzzy_transpositions": true,
                              "lenient": false,
                              "zero_terms_query": "NONE",
                              "boost": 1
                            }
                          }
                        },
                        {
                          "match": {
                            "product.hasB2bCategories": {
                              "query": true,
                              "operator": "OR",
                              "prefix_length": 0,
                              "max_expansions": 50,
                              "fuzzy_transpositions": true,
                              "lenient": false,
                              "zero_terms_query": "NONE",
                              "boost": 1
                            }
                          }
                        }
                      ],
                      "disable_coord": false,
                      "adjust_pure_negative": true,
                      "boost": 1
                    }
                  },
                  "path": "product",
                  "ignore_unmapped": false,
                  "score_mode": "avg",
                  "boost": 1
                }
              }
            ],
            "disable_coord": false,
            "adjust_pure_negative": true,
            "boost": 1
          }
        }
      ],
      "disable_coord": false,
      "adjust_pure_negative": true,
      "boost": 1
    }
  },
  "version": true,
  "aggregations": {
    "matchProductFinder": {
      "nested": {
        "path": "matchProductFinder"
      },
      "aggregations": {
        "optionLevelFilter-4": {
          "filter": {
            "bool": {
              "must": [
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "query_string": {
                              "query": "1ddf0b617b92733d5369e7cc626d2f4bf8a0b2e3c&2d08b10a32612f9d3bc06be41124becfd39536eee&3f496efcf1e057428e16ff3f09a21776bf42b2749&",
                              "default_field": "matchProductFinder.keys",
                              "fields": [],
                              "use_dis_max": true,
                              "tie_breaker": 0,
                              "default_operator": "or",
                              "auto_generate_phrase_queries": false,
                              "max_determinized_states": 10000,
                              "enable_position_increments": true,
                              "fuzziness": "AUTO",
                              "fuzzy_prefix_length": 0,
                              "fuzzy_max_expansions": 50,
                              "phrase_slop": 0,
                              "minimum_should_match": "100%",
                              "escape": false,
                              "split_on_whitespace": true,
                              "boost": 1
                            }
                          },
                          {
                            "query_string": {
                              "query": "1Automobiles et Camionettes&22013&3Hyundai&",
                              "default_field": "matchProductFinder.keysOriginal",
                              "fields": [],
                              "use_dis_max": true,
                              "tie_breaker": 0,
                              "default_operator": "or",
                              "auto_generate_phrase_queries": false,
                              "max_determinized_states": 10000,
                              "enable_position_increments": true,
                              "fuzziness": "AUTO",
                              "fuzzy_prefix_length": 0,
                              "fuzzy_max_expansions": 50,
                              "phrase_slop": 0,
                              "minimum_should_match": "100%",
                              "escape": false,
                              "split_on_whitespace": true,
                              "boost": 1
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                }
              ],
              "disable_coord": false,
              "adjust_pure_negative": true,
              "boost": 1
            }
          },
          "aggregations": {
            "optionProductFinder": {
              "nested": {
                "path": "matchProductFinder.optionProductFinder"
              },
              "aggregations": {
                "level": {
                  "terms": {
                    "field": "matchProductFinder.optionProductFinder.level",
                    "size": 10,
                    "min_doc_count": 1,
                    "shard_min_doc_count": 0,
                    "show_term_doc_count_error": false,
                    "order": [
                      {
                        "_count": "desc"
                      },
                      {
                        "_term": "asc"
                      }
                    ],
                    "include": [
                      "4"
                    ]
                  },
                  "aggregations": {
                    "name": {
                      "terms": {
                        "field": "matchProductFinder.optionProductFinder.name",
                        "size": 2147483647,
                        "min_doc_count": 1,
                        "shard_min_doc_count": 0,
                        "show_term_doc_count_error": false,
                        "order": {
                          "_term": "asc"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

GET develop_productindex_batteriesexpert_fr-fr/ProductSearch/1010115051

GET develop_productindex_batteriesexpert_fr-fr/ProductSearch/_search
{
  "_source": ["id", "matchProductFinder.keysOriginal"], 
  "query": {
    "bool": {
      "must": [
        {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "query_string": {
                              "query": "1ddf0b617b92733d5369e7cc626d2f4bf8a0b2e3c&2d08b10a32612f9d3bc06be41124becfd39536eee&3f496efcf1e057428e16ff3f09a21776bf42b2749&",
                              "default_field": "matchProductFinder.keys",
                              "fields": [],
                              "use_dis_max": true,
                              "tie_breaker": 0,
                              "default_operator": "or",
                              "auto_generate_phrase_queries": false,
                              "max_determinized_states": 10000,
                              "enable_position_increments": true,
                              "fuzziness": "AUTO",
                              "fuzzy_prefix_length": 0,
                              "fuzzy_max_expansions": 50,
                              "phrase_slop": 0,
                              "minimum_should_match": "100%",
                              "escape": false,
                              "split_on_whitespace": true,
                              "boost": 1
                            }
                          },
                          {
                            "query_string": {
                              "query": "1Automobiles et Camionettes&22013&3Hyundai&",
                              "default_field": "matchProductFinder.keysOriginal",
                              "fields": [],
                              "use_dis_max": true,
                              "tie_breaker": 0,
                              "default_operator": "or",
                              "auto_generate_phrase_queries": false,
                              "max_determinized_states": 10000,
                              "enable_position_increments": true,
                              "fuzziness": "AUTO",
                              "fuzzy_prefix_length": 0,
                              "fuzzy_max_expansions": 50,
                              "phrase_slop": 0,
                              "minimum_should_match": "100%",
                              "escape": false,
                              "split_on_whitespace": true,
                              "boost": 1
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                }
      ]
    }
  }
}




GET develop_productindex_batteriesexpert_en-us_1541033771795/ProductSearch/1010115051






GET develop_productindex_batteriesexpert_fr-fr_1541035191083/ProductSearch/_search
{
  "from": 0,
  "size": 0,
  "query": {
    "bool": {
      "filter": [
        {
          "bool": {
            "must": [
              {
                "nested": {
                  "query": {
                    "bool": {
                      "should": [
                        {
                          "match": {
                            "product.hasB2cCategories": {
                              "query": true,
                              "operator": "OR",
                              "prefix_length": 0,
                              "max_expansions": 50,
                              "fuzzy_transpositions": true,
                              "lenient": false,
                              "zero_terms_query": "NONE",
                              "boost": 1
                            }
                          }
                        },
                        {
                          "match": {
                            "product.hasB2bCategories": {
                              "query": true,
                              "operator": "OR",
                              "prefix_length": 0,
                              "max_expansions": 50,
                              "fuzzy_transpositions": true,
                              "lenient": false,
                              "zero_terms_query": "NONE",
                              "boost": 1
                            }
                          }
                        }
                      ],
                      "disable_coord": false,
                      "adjust_pure_negative": true,
                      "boost": 1
                    }
                  },
                  "path": "product",
                  "ignore_unmapped": false,
                  "score_mode": "avg",
                  "boost": 1
                }
              }
            ],
            "disable_coord": false,
            "adjust_pure_negative": true,
            "boost": 1
          }
        }
      ],
      "disable_coord": false,
      "adjust_pure_negative": true,
      "boost": 1
    }
  },
  "version": true,
  "aggregations": {
    "matchProductFinder": {
      "nested": {
        "path": "matchProductFinder"
      },
      "aggregations": {
        "optionLevelFilter-1": {
          "filter": {
            "bool": {
              "disable_coord": false,
              "adjust_pure_negative": true,
              "boost": 1
            }
          },
          "aggregations": {
            "optionProductFinder": {
              "nested": {
                "path": "matchProductFinder.optionProductFinder"
              },
              "aggregations": {
                "level": {
                  "terms": {
                    "field": "matchProductFinder.optionProductFinder.level",
                    "size": 10,
                    "min_doc_count": 1,
                    "shard_min_doc_count": 0,
                    "show_term_doc_count_error": false,
                    "order": [
                      {
                        "_count": "desc"
                      },
                      {
                        "_term": "asc"
                      }
                    ],
                    "include": [
                      "1"
                    ]
                  },
                  "aggregations": {
                    "name": {
                      "terms": {
                        "field": "matchProductFinder.optionProductFinder.name",
                        "size": 2147483647,
                        "min_doc_count": 1,
                        "shard_min_doc_count": 0,
                        "show_term_doc_count_error": false,
                        "order": {
                          "_term": "asc"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        "optionLevelFilter-2": {
          "filter": {
            "bool": {
              "must": [
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "query_string": {
                              "query": "1Automobiles et Camionettes&",
                              "default_field": "matchProductFinder.keysOriginal",
                              "fields": [],
                              "use_dis_max": true,
                              "tie_breaker": 0,
                              "default_operator": "or",
                              "auto_generate_phrase_queries": false,
                              "max_determinized_states": 10000,
                              "enable_position_increments": true,
                              "fuzziness": "AUTO",
                              "fuzzy_prefix_length": 0,
                              "fuzzy_max_expansions": 50,
                              "phrase_slop": 0,
                              "minimum_should_match": "100%",
                              "escape": false,
                              "split_on_whitespace": true,
                              "boost": 1
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                }
              ],
              "disable_coord": false,
              "adjust_pure_negative": true,
              "boost": 1
            }
          },
          "aggregations": {
            "optionProductFinder": {
              "nested": {
                "path": "matchProductFinder.optionProductFinder"
              },
              "aggregations": {
                "level": {
                  "terms": {
                    "field": "matchProductFinder.optionProductFinder.level",
                    "size": 10,
                    "min_doc_count": 1,
                    "shard_min_doc_count": 0,
                    "show_term_doc_count_error": false,
                    "order": [
                      {
                        "_count": "desc"
                      },
                      {
                        "_term": "asc"
                      }
                    ],
                    "include": [
                      "2"
                    ]
                  },
                  "aggregations": {
                    "name": {
                      "terms": {
                        "field": "matchProductFinder.optionProductFinder.name",
                        "size": 2147483647,
                        "min_doc_count": 1,
                        "shard_min_doc_count": 0,
                        "show_term_doc_count_error": false,
                        "order": {
                          "_term": "asc"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        "optionLevelFilter-3": {
          "filter": {
            "bool": {
              "must": [
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "query_string": {
                              "query": "1Automobiles et Camionettes&22013&",
                              "default_field": "matchProductFinder.keysOriginal",
                              "fields": [],
                              "use_dis_max": true,
                              "tie_breaker": 0,
                              "default_operator": "or",
                              "auto_generate_phrase_queries": false,
                              "max_determinized_states": 10000,
                              "enable_position_increments": true,
                              "fuzziness": "AUTO",
                              "fuzzy_prefix_length": 0,
                              "fuzzy_max_expansions": 50,
                              "phrase_slop": 0,
                              "minimum_should_match": "100%",
                              "escape": false,
                              "split_on_whitespace": true,
                              "boost": 1
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                }
              ],
              "disable_coord": false,
              "adjust_pure_negative": true,
              "boost": 1
            }
          },
          "aggregations": {
            "optionProductFinder": {
              "nested": {
                "path": "matchProductFinder.optionProductFinder"
              },
              "aggregations": {
                "level": {
                  "terms": {
                    "field": "matchProductFinder.optionProductFinder.level",
                    "size": 10,
                    "min_doc_count": 1,
                    "shard_min_doc_count": 0,
                    "show_term_doc_count_error": false,
                    "order": [
                      {
                        "_count": "desc"
                      },
                      {
                        "_term": "asc"
                      }
                    ],
                    "include": [
                      "3"
                    ]
                  },
                  "aggregations": {
                    "name": {
                      "terms": {
                        "field": "matchProductFinder.optionProductFinder.name",
                        "size": 2147483647,
                        "min_doc_count": 1,
                        "shard_min_doc_count": 0,
                        "show_term_doc_count_error": false,
                        "order": {
                          "_term": "asc"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        "optionLevelFilter-4": {
          "filter": {
            "bool": {
              "must": [
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "query_string": {
                              "query": "1Automobiles et Camionettes&22013&3Hyundai&",
                              "default_field": "matchProductFinder.keysOriginal",
                              "fields": [],
                              "use_dis_max": true,
                              "tie_breaker": 0,
                              "default_operator": "or",
                              "auto_generate_phrase_queries": false,
                              "max_determinized_states": 10000,
                              "enable_position_increments": true,
                              "fuzziness": "AUTO",
                              "fuzzy_prefix_length": 0,
                              "fuzzy_max_expansions": 50,
                              "phrase_slop": 0,
                              "minimum_should_match": "100%",
                              "escape": false,
                              "split_on_whitespace": true,
                              "boost": 1
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                }
              ],
              "disable_coord": false,
              "adjust_pure_negative": true,
              "boost": 1
            }
          },
          "aggregations": {
            "optionProductFinder": {
              "nested": {
                "path": "matchProductFinder.optionProductFinder"
              },
              "aggregations": {
                "level": {
                  "terms": {
                    "field": "matchProductFinder.optionProductFinder.level",
                    "size": 10,
                    "min_doc_count": 1,
                    "shard_min_doc_count": 0,
                    "show_term_doc_count_error": false,
                    "order": [
                      {
                        "_count": "desc"
                      },
                      {
                        "_term": "asc"
                      }
                    ],
                    "include": [
                      "4"
                    ]
                  },
                  "aggregations": {
                    "name": {
                      "terms": {
                        "field": "matchProductFinder.optionProductFinder.name",
                        "size": 2147483647,
                        "min_doc_count": 1,
                        "shard_min_doc_count": 0,
                        "show_term_doc_count_error": false,
                        "order": {
                          "_term": "asc"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}



GET develop_productindex_batteriesexpert_fr-fr/ProductSearch/1010115051

GET develop_productindex_batteriesexpert_fr-fr/ProductSearch/_mapping

GET develop_productindex_batteriesexpert_fr-fr_1541035191083/ProductSearch/_search
{
  "from": 0,
  "size": 0,
  "query": {
    "bool": {
      "filter": [
        {
          "bool": {
            "must": [
              {
                "nested": {
                  "query": {
                    "bool": {
                      "should": [
                        {
                          "match": {
                            "product.hasB2cCategories": {
                              "query": true,
                              "operator": "OR",
                              "prefix_length": 0,
                              "max_expansions": 50,
                              "fuzzy_transpositions": true,
                              "lenient": false,
                              "zero_terms_query": "NONE",
                              "boost": 1
                            }
                          }
                        },
                        {
                          "match": {
                            "product.hasB2bCategories": {
                              "query": true,
                              "operator": "OR",
                              "prefix_length": 0,
                              "max_expansions": 50,
                              "fuzzy_transpositions": true,
                              "lenient": false,
                              "zero_terms_query": "NONE",
                              "boost": 1
                            }
                          }
                        }
                      ],
                      "disable_coord": false,
                      "adjust_pure_negative": true,
                      "boost": 1
                    }
                  },
                  "path": "product",
                  "ignore_unmapped": false,
                  "score_mode": "avg",
                  "boost": 1
                }
              }
            ],
            "disable_coord": false,
            "adjust_pure_negative": true,
            "boost": 1
          }
        }
      ],
      "disable_coord": false,
      "adjust_pure_negative": true,
      "boost": 1
    }
  },
  "version": true,
  "aggregations": {
    "matchProductFinder": {
      "nested": {
        "path": "matchProductFinder"
      },
      "aggregations": {
        "optionLevelFilter-4": {
          "filter": {
            "bool": {
              "must": [
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "query_string": {
                              "query": "(1Automobiles et Camionettes 22013 3Hyundai )",
                              "default_field": "matchProductFinder.keysOriginal",
                              "fields": [],
                              "use_dis_max": true,
                              "tie_breaker": 0,
                              "default_operator": "or",
                              "auto_generate_phrase_queries": false,
                              "max_determinized_states": 10000,
                              "enable_position_increments": true,
                              "fuzziness": "AUTO",
                              "fuzzy_prefix_length": 0,
                              "fuzzy_max_expansions": 50,
                              "phrase_slop": 0,
                              "minimum_should_match": "100%",
                              "escape": false,
                              "split_on_whitespace": true,
                              "boost": 1
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                }
              ],
              "disable_coord": false,
              "adjust_pure_negative": true,
              "boost": 1
            }
          },
          "aggregations": {
            "optionProductFinder": {
              "nested": {
                "path": "matchProductFinder.optionProductFinder"
              },
              "aggregations": {
                "level": {
                  "terms": {
                    "field": "matchProductFinder.optionProductFinder.level",
                    "size": 10,
                    "min_doc_count": 1,
                    "shard_min_doc_count": 0,
                    "show_term_doc_count_error": false,
                    "order": [
                      {
                        "_count": "desc"
                      },
                      {
                        "_term": "asc"
                      }
                    ],
                    "include": [
                      "3"
                    ]
                  },
                  "aggregations": {
                    "name": {
                      "terms": {
                        "field": "matchProductFinder.optionProductFinder.name",
                        "size": 2147483647,
                        "min_doc_count": 1,
                        "shard_min_doc_count": 0,
                        "show_term_doc_count_error": false,
                        "order": {
                          "_term": "asc"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}


GET develop_productindex_batteriesexpert_fr-fr/ProductSearch/_search
{
  "query": {
    "bool": {
              "must": [
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "query_string": {
                              "query": "(Automobiles-et-Camionettes_2013_Hyundai_)",
                              "default_field": "matchProductFinder.keysOriginal",
                              "fields": [],
                              "use_dis_max": true,
                              "tie_breaker": 0,
                              "default_operator": "or",
                              "auto_generate_phrase_queries": false,
                              "max_determinized_states": 10000,
                              "enable_position_increments": true,
                              "fuzziness": "AUTO",
                              "fuzzy_prefix_length": 0,
                              "fuzzy_max_expansions": 50,
                              "phrase_slop": 0,
                              "minimum_should_match": "100%",
                              "escape": false,
                              "split_on_whitespace": true,
                              "boost": 1
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                }
              ],
              "disable_coord": false,
              "adjust_pure_negative": true,
              "boost": 1
            }
  }
}






GET develop_productindex_batteriesexpert_fr-fr/ProductSearch/_search
{
  "query": {
    "bool": {
              "must": [
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "query_string": {
                              "default_field": "matchProductFinder.keysOriginal",
                              "query": "Automobiles-et-Camionettes_2013_Hyundai_",
                              "minimum_should_match": "100%"
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                }
              ],
              "disable_coord": false,
              "adjust_pure_negative": true,
              "boost": 1
            }
  }
}








GET develop_productindex_batteriesexpert_fr-fr_1541045735306/ProductSearch/_search
{
  "from": 0,
  "size": 0,
  "query": {
    "bool": {
      "filter": [
        {
          "bool": {
            "must": [
              {
                "nested": {
                  "query": {
                    "bool": {
                      "should": [
                        {
                          "match": {
                            "product.hasB2cCategories": {
                              "query": true,
                              "operator": "OR",
                              "prefix_length": 0,
                              "max_expansions": 50,
                              "fuzzy_transpositions": true,
                              "lenient": false,
                              "zero_terms_query": "NONE",
                              "boost": 1
                            }
                          }
                        },
                        {
                          "match": {
                            "product.hasB2bCategories": {
                              "query": true,
                              "operator": "OR",
                              "prefix_length": 0,
                              "max_expansions": 50,
                              "fuzzy_transpositions": true,
                              "lenient": false,
                              "zero_terms_query": "NONE",
                              "boost": 1
                            }
                          }
                        }
                      ],
                      "disable_coord": false,
                      "adjust_pure_negative": true,
                      "boost": 1
                    }
                  },
                  "path": "product",
                  "ignore_unmapped": false,
                  "score_mode": "avg",
                  "boost": 1
                }
              }
            ],
            "disable_coord": false,
            "adjust_pure_negative": true,
            "boost": 1
          }
        }
      ],
      "disable_coord": false,
      "adjust_pure_negative": true,
      "boost": 1
    }
  },
  "version": true,
  "aggregations": {
    "matchProductFinder": {
      "nested": {
        "path": "matchProductFinder"
      },
      "aggregations": {
        "optionLevelFilter-4": {
          "filter": {
            "bool": {
              "must": [
                {
                  "nested": {
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "query_string": {
                              "query": "Automobiles-et-Camionettes_2013_Hyundai_",
                              "default_field": "matchProductFinder.keysOriginal",
                              "fields": [],
                              "use_dis_max": true,
                              "tie_breaker": 0,
                              "default_operator": "or",
                              "auto_generate_phrase_queries": false,
                              "max_determinized_states": 10000,
                              "enable_position_increments": true,
                              "fuzziness": "AUTO",
                              "fuzzy_prefix_length": 0,
                              "fuzzy_max_expansions": 50,
                              "phrase_slop": 0,
                              "minimum_should_match": "100%",
                              "escape": false,
                              "split_on_whitespace": true,
                              "boost": 1
                            }
                          }
                        ],
                        "disable_coord": false,
                        "adjust_pure_negative": true,
                        "boost": 1
                      }
                    },
                    "path": "matchProductFinder",
                    "ignore_unmapped": false,
                    "score_mode": "avg",
                    "boost": 1
                  }
                }
              ],
              "disable_coord": false,
              "adjust_pure_negative": true,
              "boost": 1
            }
          },
          "aggregations": {
            "optionProductFinder": {
              "nested": {
                "path": "matchProductFinder.optionProductFinder"
              },
              "aggregations": {
                "level": {
                  "terms": {
                    "field": "matchProductFinder.optionProductFinder.level",
                    "size": 10,
                    "min_doc_count": 1,
                    "shard_min_doc_count": 0,
                    "show_term_doc_count_error": false,
                    "order": [
                      {
                        "_count": "desc"
                      },
                      {
                        "_term": "asc"
                      }
                    ]
                  },
                  "aggregations": {
                    "name": {
                      "terms": {
                        "field": "matchProductFinder.optionProductFinder.name",
                        "size": 2147483647,
                        "min_doc_count": 1,
                        "shard_min_doc_count": 0,
                        "show_term_doc_count_error": false,
                        "order": {
                          "_term": "asc"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
