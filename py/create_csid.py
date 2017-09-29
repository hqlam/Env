#!/usr/bin/env python

# Given host IP of 2d or 4d core
# create csid, (with return code 200)
import os,sys, requests, json
from requests.exceptions import ConnectionError
requests.packages.urllib3.disable_warnings()

cert_path = './client.pem'
host      = sys.argv[1] + ":8080"

api       = '/api/v1/gateway-configset'
url       = "http://" + host  + api 
print url

resp = json.loads(requests.post(url,cert = cert_path,verify = False).text)

# verify
if resp['status'] == 200:
    print "\nAction successfully"
print  json.dumps(resp, indent=4)

#http://96.119.227.212:8080/api/v1/gateway-configset
#{
#    "status": 200, 
#    "message": "Success Message", 
#    "data": {
#        "xpc_csid": "3d687a1e-393b-47d1-85e9-26a5c07443b8"
#    }
#python -c "import sys,json,os,requests; print json.loads(requests.post
