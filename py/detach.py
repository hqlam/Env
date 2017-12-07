#!/usr/bin/env python

import os,sys, requests, json
from requests.exceptions import ConnectionError
requests.packages.urllib3.disable_warnings()

cert_path = './client.pem'
mac       = sys.argv[1]
host      = sys.argv[2] + ":8080"

# 1/2 [amh] get csid (mac, host)			[amh]
api  = '/api/v1/gateway-cpe/'
url  = "http://" + host  + "/api/v1/gateway-cpe/" + mac + '/association'
print  "GET   ", url
resp = json.loads(requests.get(url,cert = cert_path,verify = False).text)
csid = resp["data"]["xpc_csid"]
print  csid


# 2/2 [detach] [disassociate] del asso (mac, host, csid)  [dmh]
api  = '/api/v1/gateway-configset/'
url  = "http://" + host + "/api/v1/gateway-configset/" + csid + '/gateway-cpe/' + mac + '/association'
print "DELETE ", url
resp = json.loads(requests.delete(url,cert = cert_path,verify = False).text)
print  json.dumps(resp, indent=4)
