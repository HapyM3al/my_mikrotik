#/usr/bin/python

import requests
import json
import os
import sys
import paramiko

headers = {
    'Content-Type': 'application/json',
}

params = (
    ('pretty', ''),
)

ssh_params = {
    'hostname': '10.50.0.1',
    'username': 'createblacklist',
    'password': 'password123456789',
    'port': 22,
    'pkey': None,
    'key_filename': None,
    'timeout': 5,
    'allow_agent': False,
    'look_for_keys': False,
    'compress': False,
    'sock': None,
    'gss_auth': False,
    'gss_kex': False,
    'gss_deleg_creds': False,
    'gss_host': None,
    'banner_timeout': None
}

data = '{"aggs": {"2": {"terms": {"field": "flow.client_hostname", "order": {"_count": "desc"}, "size": 100 }, "aggs": {"3": {"terms": {"field": "flow.client_addr", "order": {"_count": "desc"}, "size": 10 } } } } }, "size": 0, "_source": {"excludes": [] }, "stored_fields": ["*"], "script_fields": {}, "docvalue_fields": [{"field": "@timestamp", "format": "date_time"}, {"field": "ipfix.flowEndMicroseconds", "format": "date_time"}, {"field": "ipfix.flowEndMilliseconds", "format": "date_time"}, {"field": "ipfix.flowEndNanoseconds", "format": "date_time"}, {"field": "ipfix.flowEndSeconds", "format": "date_time"}, {"field": "ipfix.flowStartMicroseconds", "format": "date_time"}, {"field": "ipfix.flowStartMilliseconds", "format": "date_time"}, {"field": "ipfix.flowStartNanoseconds", "format": "date_time"}, {"field": "ipfix.flowStartSeconds", "format": "date_time"}, {"field": "netflow.event_time_msec", "format": "date_time"}, {"field": "netflow.first_switched", "format": "date_time"}, {"field": "netflow.flowEndMicroseconds", "format": "date_time"}, {"field": "netflow.flowEndNanoseconds", "format": "date_time"}, {"field": "netflow.flowEndSeconds", "format": "date_time"}, {"field": "netflow.flowStartMicroseconds", "format": "date_time"}, {"field": "netflow.flowStartNanoseconds", "format": "date_time"}, {"field": "netflow.flowStartSeconds", "format": "date_time"}, {"field": "netflow.last_switched", "format": "date_time"} ], "query": {"bool": {"must": [{"match_all": {} }, {"query_string": {"analyze_wildcard": true, "default_field": "*", "query": "*", "time_zone": "Africa/Johannesburg"} } ], "filter": [{"exists": {"field": "flow.client_rep_tags"} }, {"range": {"@timestamp": {"format": "strict_date_optional_time", "gte": "now-1d/d", "lte": "now/d"} } } ], "should": [], "must_not": [] } } }'

response = requests.get('http://localhost:9200/_search?pretty', headers=headers, data=data)
results = json.loads(response.text)

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(**ssh_params)
removecurrentlist = ':if ([:len [/ip firewall address-list find comment="elastiflowblacklist"]] > 1) do={/ip firewall address-list remove [find where comment="elastiflowblacklist"]}'
print(removecurrentlist)
stdin, stdout, stderr = ssh.exec_command(removecurrentlist)
ssh.close()
time.sleep(5)

ssh.connect(**ssh_params)

for x in range (0,100):
    buckets = json.dumps((results["aggregations"]["2"]["buckets"][x]["key"]))
    iplist = json.dumps(buckets)
    strip = (iplist[3:-3])
    #print(strip)
    mtcommand = '/ip firewall address-list add list=blacklist comment="elastiflowblacklist" address={} '.format(strip)
    print(mtcommand)
    stdin, stdout, stderr = ssh.exec_command(mtcommand)

mtlog = '/log warning "added new elastiflow blacklist"'
print(mtlog)

ssh.close()

