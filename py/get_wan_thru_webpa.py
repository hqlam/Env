#!/usr/local/bin/python2.7
import os, sys, requests, time,json
#import pdb ; pdb.set_trace()

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
url     = "https://api.webpa.comcast.net:8090" + '/api/v2/device/' + "mac:" + mac + "/config?names=Device.DeviceInfo.X_COMCAST-COM_WAN_IP"
print url
resp = json.loads(requests.get(url, headers=headers).text)
print  json.dumps(resp, indent=4)

