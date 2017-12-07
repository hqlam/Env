#!/usr/bin/env python

import os,sys, requests, json
from requests.exceptions import ConnectionError
requests.packages.urllib3.disable_warnings()

cert_path = './client.pem'
mac       = sys.argv[1]
host      = sys.argv[2] + ":8080"

# 1/3 get csid (mac, host) 			[amh]

api  = '/api/v1/gateway-cpe/'
url  = "http://" + host  + api + mac + '/association'
print  "GET  ", url
resp = json.loads(requests.get(url,cert = cert_path,verify = False).text)
csid = resp["data"]["xpc_csid"]
print  "GET  ", csid


# 2/3 del asso (mac, host, csid) [detach] [disassociate] 	[dmh]

api  = '/api/v1/gateway-configset/'
url  = "http://" + host + api + csid + '/gateway-cpe/' + mac + '/association'
print "DELETE ", url
resp = json.loads(requests.delete(url,cert = cert_path,verify = False).text)
print  json.dumps(resp, indent=4)


# 3/3 del cpe from db (mac, host) 		[purge] [pmh]

api  = '/api/v1/gateway-cpe/'
url  = "http://" + host + api + mac
print "DELETE ", url
resp = json.loads(requests.delete(url,cert = cert_path,verify = False).text)
print  json.dumps(resp, indent=4)
