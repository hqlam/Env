#!/usr/bin/env python

import os,sys, requests, json
from requests.exceptions import ConnectionError
requests.packages.urllib3.disable_warnings()

cert_path = './client.pem'
mac       = sys.argv[1]
host      = sys.argv[2] + ":8080"

# 1/2 get csid (mac, host)
api  = '/api/v1/gateway-cpe/'
url  = "http://" + host  + api + mac + '/association'
print  url
resp = json.loads(requests.get(url,cert = cert_path,verify = False).text)
csid = resp["data"]["xpc_csid"]
print  csid


# 2/2 del asso (mac, host, csid)
api  = '/api/v1/gateway-configset/'
url  = "http://" + host + api + csid + '/gateway-cpe/' + mac + '/association'
print url
resp = json.loads(requests.delete(url,cert = cert_path,verify = False).text)

# verify
if resp['status'] == 200:
    print "\nAction successfully"
print  json.dumps(resp, indent=4)

