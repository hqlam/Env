#!/usr/local/bin/python2.7

import os, sys, requests, time,json

mac     = sys.argv[1]
webpa   = "https://api.webpa.comcast.net:8090"
sat_token_headers= {
    'X-Client-Id'    : "x1:prod:xpc:09089c",
    'X-Client-Secret': "d2e5da18d981389adddfe60c5d475fe3"
}

#  1/2 Use id an secret post to codebig, to retrieve sat token access code
sat_token_url = "https://sat-prod.codebig2.net/oauth/token"
r = requests.post(sat_token_url, headers=sat_token_headers)
sat_token = r.json()['access_token']

# 2/2 Use access token ad mac to get Firmwarename
headers = {"Authorization": "Bearer " + sat_token}

config = "/config?names=Device.X_CISCO_COM_CableModem.IPv6Address"
m       = "mac:" + mac
url     = webpa + '/api/v2/device/' + m + config
print url
resp = json.loads(requests.get(url, headers=headers).text)
print  json.dumps(resp, indent=4)

# Result:
#{
#    "parameters": [
#        {
#            "dataType": 0, 
#            "message": "Success", 
#            "parameterCount": 1, 
#            "name": "Device.X_CISCO_COM_CableModem.IPv6Address", 
#            "value": "2001:558:4000:1a:1286:8cff:feea:6d24"
#        }
#    ], 
#    "statusCode": 200
#}

