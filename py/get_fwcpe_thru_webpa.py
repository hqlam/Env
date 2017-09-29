#!/usr/local/bin/python2.7

import os, sys, requests, time,json

# args = sys.argv[1:]
# if not args:
#     print "usage is prod_webpa.py <mac>"
#     sys.exit()

mac     = sys.argv[1]

webpa   = "https://api.webpa.comcast.net:8090"
sat_token_headers= {
    'X-Client-Id'    : "x1:prod:xpc:09089c",
    'X-Client-Secret': "d2e5da18d981389adddfe60c5d475fe3"
}

#  1/2 Use id an secret post to codebig, to retrieve sat token access code
sat_token_url = "https://sat-prod.codebig2.net/oauth/token"
print       sat_token_url
r = requests.post(sat_token_url, headers=sat_token_headers)
sat_token = r.json()['access_token']
print       sat_token

# 2/2 Use access token ad mac to get Firmwarename
headers = {"Authorization": "Bearer " + sat_token}
#print headers
config  = "/config?names=Device.DeviceInfo.X_CISCO_COM_FirmwareName"
#config = "/config?names=Device.DeviceInfo.X_COMCAST-COM_CM_IP"
m       = "mac:" + mac
url     = webpa + '/api/v2/device/' + m + config
print url
resp = json.loads(requests.get(url, headers=headers).text)
print  json.dumps(resp, indent=4)

# hlam001c@cacsvlo-16686:~$ py get_fwcpe_thru_webpa.py $M2
# https://api.webpa.comcast.net:8090/api/v2/device/mac:044E5A9AE8EC/config?names=Device.DeviceInfo.X_CISCO_COM_FirmwareName
# {
#     "parameters": [
#         {
#             "dataType": 0, 
#             "message": "Success", 
#             "parameterCount": 1, 
#             "name": "Device.DeviceInfo.X_CISCO_COM_FirmwareName", 
#             "value": "TG1682_2.5s2_PROD_sey"
#         }
#     ], 
#     "statusCode": 200
# }
