#!/usr/bin/python2.7
'''
cpe onb already.
'''

import os, sys, requests, time,json

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

# 2. GET use the access_token, and MAC to get the field CloudUIEnable
headers   = {"Authorization": "Bearer " + sat_token}

#config   = "/config?names=Device.DeviceInfo.X_RDKCENTRAL-COM_CloudUIEnable"
url       = "https://api.webpa.comcast.net:8090" + '/api/v2/device/' + "mac:" + mac + "/config?names=Device.DeviceInfo.X_RDKCENTRAL-COM_CloudUIEnable"

#config   = "/config?names=Device.DeviceInfo.X_RDKCENTRAL-COM_ConfigureWiFi"
#url       = "https://api.webpa.comcast.net:8090" + '/api/v2/device/' + "mac:" + mac + "/config?names=Device.DeviceInfo.X_RDKCENTRAL-COM_CloudUIEnable"

print  "GET ", url
resp = json.loads(requests.get(url, headers=headers).text)
print  json.dumps(resp, indent=4)

## 3. POST use the access_token, and MAC to get the field CloudUIEnable
#headers   = {"Authorization": "Bearer " + sat_token}
#m         = "mac:" + mac
#url       = "https://api.webpa.comcast.net:8090" + '/api/v2/device/' + "mac:" + mac + "/config?names=Device.DeviceInfo.X_RDKCENTRAL-COM_CloudUIEnable"
#print url
#resp = json.loads(requests.patch(url, headers=headers).text)
#print  json.dumps(resp, indent=4)

