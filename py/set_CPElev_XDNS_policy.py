#!/usr/bin/python2.7
'''
cpe onb already.
'''
import os,sys, requests, json
from requests.exceptions import ConnectionError
requests.packages.urllib3.disable_warnings()

cert_path = './client.pem'

mac       = sys.argv[1]
# must be odpcore host 
host      = sys.argv[2] + ":8080"
#host     = 'http://96.118.59.53:8080'

api       = '/api/v1/operational/gateway-cpe/'
url       = "http://" + host + api + mac + '/xdns_content_filtering'

# payload data to post
data      = { "filter_level":1 }

print url
print data

print json.dumps(json.loads(requests.post(url,json=data,cert=cert_path,verify=False).text),indent=4)

# hlam001c@cacsvlo-16686:~/Downloads$ hncore 96.118.61.32
# Connection to 96.118.61.32 closed.
# odpcore-asb-2d-red

# hlam001c@cacsvlo-16686:~$ py set_CPElev_XDNS_policy.py $M1 96.118.61.32
# http://96.118.61.32:8080/api/v1/operational/gateway-cpe/10868CEA6D24/xdns_content_filtering
# {'filter_level': 1}
# {
#     "status": 200, 
#     "message": "Success Message", 
#     "data": {
#         "filter_level": 1
#     }
# }
