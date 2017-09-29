#!/usr/bin/env python

import os,sys, requests, json
from requests.exceptions import ConnectionError
requests.packages.urllib3.disable_warnings()

cert_path = './client.pem'
mac       = sys.argv[1]
host      = sys.argv[2] + ":8080"

# [purge]    del cpe from db (mac, host)
api  = '/api/v1/gateway-cpe/'
url  = "http://" + host + '/api/v1/gateway-cpe/' + mac
print "DELETE ", url
resp = json.loads(requests.delete(url,cert = cert_path,verify = False).text)

# verify
if resp['status'] == 200:
    print "\nAction successfully"
print  json.dumps(resp, indent=4)
