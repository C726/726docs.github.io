# Elasticsearch

```shell
curl -u admin:yunLifang http://218.93.207.90:9200/
curl -u admin:yunLifang http://218.93.207.90:9200/_cat/master
curl -u admin:yunLifang http://218.93.207.90:9200/_cat/master?help
curl -u admin:yunLifang http://218.93.207.90:9200/_cat/nodes
curl -u admin:yunLifang http://218.93.207.90:9200/_cat/indices
curl -s -u admin:yunLifang 'http://218.93.207.90:9200/_cat/indices?format=json&pretty' | jq .
curl -s -H "Accept: application/json" -u admin:yunLifang 'http://218.93.207.90:9200/_cat/indices?pretty' | jq .

{"query":{"match":{"host.name":"DELL529AD"}}},"_source":["ip","host.name"]}

{"query":{"bool":{"must":{"match":{"host.name":"DELL529AD"}},"filter":{"range":{"time":{"gt":"2021-09-08"}}}}},"_source":["host.name","ip"]}

```