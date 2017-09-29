#!/usr/bin/env python
# Given a MAC, associate it to CPE, as param $1
# return code 200 means OK, the MAC got associate already
# process needs a valid certificate
import os,sys, requests, json
from requests.exceptions import ConnectionError
requests.packages.urllib3.disable_warnings()

cert_path = './client.pem'
mac       = sys.argv[1]
# cxip yellow /xpc/yellow/xpccore/xpccore-ch2f-2d-yellow": {"ip": "96.119.225.204",
# cxip amber: /xpc/amber/xpccore/xpccore-ch2f-2d-amber 96.119.227.212:8080
# cxip red: /xpc/red/xpccore/xpccore-asb-4d-red "ip": "96.118.57.13",
# hostY      = '96.119.225.204:8080'
# hostA      = '96.119.227.212:8080'
# hostR      = '96.118.57.13:8080'
# host      = hostY
host      = sys.argv[2] + ":8080"
api       = '/api/v1/gateway-cpe/'
url  = "http://" + host  + api + mac + '/association'
print url

# check if there exist an association from the given mac address
resp = json.loads(requests.get(url,cert = cert_path,verify = False).text)

# verify
if resp['status'] == 200:
    print "\nAction successfully"
print  json.dumps(resp, indent=4)


# #hlam001c@cacsvlo-16686:~$ 
# hlam001c@cacsvlo-16686:~$ python -c "import sys,json,os,requests; print json.loads(requests.get('http://96.119.227.212:8080/api/v1/gateway-cpe/10868CEA6D24/association',cert='./client.pem',verify=False).text)" 
# {u'status': 200, u'message': u'Success Message', u'data': {u'xpc_csid': u'6aa992dd-0634-429f-afd9-1a6eee29d6d1'}}

# hlam001c@cacsvlo-16686:~$ py check_association.py 10868CEA6D24
# {
#     "status": 200, 
#     "message": "Success Message", 
#     "data": {
#         "xpc_csid": "6aa992dd-0634-429f-afd9-1a6eee29d6d1"
#     }
# }
# hlam001c@cacsvlo-16686:~$ 
