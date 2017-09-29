#!/usr/bin/python2.7
'''
cpe onb already.
'''

import os, sys, requests, time,json

# args = sys.argv[1:]
# if not args:
#     print "usage is prod_webpa.py <mac>"
#     sys.exit()

mac=sys.argv[1]

webpa = "https://api.webpa.comcast.net:8090"
sat_token_headers= {
    'X-Client-Id'    : "x1:prod:xpc:09089c",
    'X-Client-Secret': "d2e5da18d981389adddfe60c5d475fe3"
}

# 1. post clientid and secret to get access_token from codebig
url_sat_token = "https://sat-prod.codebig2.net/oauth/token"
print       url_sat_token
r = requests.post(url_sat_token, headers=sat_token_headers)
sat_token = r.json()['access_token']
print       sat_token

# 2. use the access_token, and MAC to get the field EnableXdns
headers   = {"Authorization": "Bearer " + sat_token}
config    = "/config?names=Device.DeviceInfo.X_RDKCENTRAL-COM_EnableXDNS"
m         = "mac:" + mac
#url       = webpa + '/api/v2/device/' + m + config
url       = "https://api.webpa.comcast.net:8090" + '/api/v2/device/' + "mac:" + mac + "/config?names=Device.DeviceInfo.X_RDKCENTRAL-COM_EnableXDNS"
print url
resp = json.loads(requests.get(url, headers=headers).text)
print  json.dumps(resp, indent=4)

# hlam001c@cacsvlo-16686:~$ py xdns_enable.py $M1
# https://sat-prod.codebig2.net/oauth/token
# eyJraWQiOiJzYXQtcHJvZC1rMS0xMDI0IiwiYWxnIjoiUlMyNTYifQ.eyJqdGkiOiI4MjYwZDY0Yi04YTk4LTRkZDQtODI2OS01MzlhYjZiOWRiNWQiLCJpc3MiOiJzYXRzLXByb2R1Y3Rpb24iLCJzdWIiOiJ4MTpwcm9kOnhwYzowOTA4OWMiLCJpYXQiOjE0OTE1ODU2OTgsIm5iZiI6MTQ5MTU4NTY5OCwiZXhwIjoxNDkxNjcyMTAxLCJ2ZXJzaW9uIjoiMS4wIiwiYWxsb3dlZFJlc291cmNlcyI6eyJhbGxvd2VkUGFydG5lcnMiOlsiY29tY2FzdCJdfSwiY2FwYWJpbGl0aWVzIjpbIngxOndlYnBhOmFwaTpkZXZpY2UvLiovY29uZmlnXFxiOmFsbCIsIngxOndlYnBhOmFwaTpkZXZpY2UvLiovY29uZmlnXFxiOmdldCIsIngxOndlYnBhOmFwaTpkZXZpY2UvLiovc3RhdFxcYjpnZXQiLCJ4MTp3ZWJwYTphcGk6aG9va1xcYjpwb3N0IiwieDE6d2VicGE6YXBpOmhvb2tzXFxiOmdldCJdLCJhdWQiOltdfQ.Yl0aepnfMocMJHY2DwN4c5jvPDMBwwKmexP_eQ8MaBlMLZqxdngiI9OJclqnbDQpMiihxYyDXWSN0JrbNXhm-PlFnGhkGYauWbZEo1P4u3lFHMY7yTXUKV-VbOGMgda-qKEOI6tulGiakuI-9rAJPn4gFTrfh8JsWaVm4752XG8
# https://api.webpa.comcast.net:8090/api/v2/device/mac:10868CEA6D24/config?names=Device.DeviceInfo.X_RDKCENTRAL-COM_EnableXDNS
# {
#     "parameters": [
#         {
#             "dataType": 3, 
#             "message": "Success", 
#             "parameterCount": 1, 
#             "name": "Device.DeviceInfo.X_RDKCENTRAL-COM_EnableXDNS", 
#             "value": "false"
#         }
#     ], 
#     "statusCode": 200
# }


# # used this POST to reset value:false for XDNS: $ cP http://96.118.57.13:8080/api/v1/internal/gateway-cpe/10868CEA6D24/tunnel @xvF.json
# file xvF.json: {"parameters":[ {"name":"Device.DeviceInfo.X_RDKCENTRAL-COM_EnableXDNS","value": "false", "dataType":3}]}



