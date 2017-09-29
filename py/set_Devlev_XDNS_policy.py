
#!/usr/local/bin/python2.7

import sys, requests, json
from requests.exceptions import ConnectionError
requests.packages.urllib3.disable_warnings()

# args = sys.argv[1:]
# if not args:
#     print "usage is set_schedule.py <mac>"
#     sys.exit()

cert_path = './client.pem'
mac       = sys.argv[1]

# must be odpcore host
host      = sys.argv[2] + ":8080"
#host      = 'http://96.118.59.53:8080'


api       = '/api/v1/operational/gateway-cpe/'
url       = "http://" + host + api + mac + '/devices/xdns_content_filtering' 

# payload data to post
data = { "xdns_content_filtering_list": [{"device_mac": "dd00dd00dd00", "filter_level": 0}, {"device_mac": "dd11dd11dd11", "filter_level": 1}, {"device_mac": "dd22dd22dd22", "filter_level": 2}, {"device_mac": "dd33dd33dd33", "filter_level": 3}]}

print url
print data

print json.dumps(json.loads(requests.post(url,json=data,cert=cert_path,verify=False).text),indent=4)
# data to post
# {
# 	"xdns_content_filtering_list": [
# 		{
# 			"device_mac": "dd00dd00dd00",
# 			"filter_level": 0
# 		},
# 		{
# 			"device_mac": "dd11dd11dd11",
# 			"filter_level": 1
# 		},
# 		{
# 			"device_mac": "dd22dd22dd22",
# 			"filter_level": 2
# 		},
# 		{
# 			"device_mac": "dd33dd33dd33",
# 			"filter_level": 3
# 		}
# 	]
# }

# hlam001c@cacsvlo-16686:~$ py set_Devlev_XDNS_policy.py $M1 96.118.51.38
# http://96.118.51.38:8080/api/v1/operational/gateway-cpe/10868CEA6D24/devices/xdns_content_filtering
# {'xdns_content_filtering_list': [{'filter_level': 0, 'device_mac': 'dd00dd00dd00'}, {'filter_level': 1, 'device_mac': 'dd11dd11dd11'}, {'filter_level': 2, 'device_mac': 'dd22dd22dd22'}, {'filter_level': 3, 'device_mac': 'dd33dd33dd33'}]}
# {
#     "status": 200, 
#     "message": "Success Message", 
#     "data": {
#         "xdns_content_filtering_list": [
#             {
#                 "filter_level": 0, 
#                 "device_mac": "DD00DD00DD00"
#             }, 
#             {
#                 "filter_level": 1, 
#                 "device_mac": "DD11DD11DD11"
#             }, 
#             {
#                 "filter_level": 2, 
#                 "device_mac": "DD22DD22DD22"
#             }, 
#             {
#                 "filter_level": 3, 
#                 "device_mac": "DD33DD33DD33"
#             }
#         ]
#     }
# }
