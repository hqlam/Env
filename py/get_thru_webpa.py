#!/usr/local/bin/python2.7
import os, sys, requests, time,json
from django.utils.termcolors import colorize
# source: https://stackoverflow.com/questions/287871/print-in-terminal-with-colors-using-python
# python -c "import django; print django.VERSION"

#import pdb ; pdb.set_trace()

mac     = sys.argv[1]
obj     = sys.argv[2]
#obj like Device.DeviceInfo.X_COMCAST-COM_WAN_IP

webpa   = "https://api.webpa.comcast.net:8090"
sat_token_headers= {
    'X-Client-Id'    : "x1:prod:xpc:09089c",
    'X-Client-Secret': "d2e5da18d981389adddfe60c5d475fe3"
}

# Use id an secret post to codebig, to retrieve sat token access code
sat_token_url = "https://sat-prod.codebig2.net/oauth/token"
#print      colorize("Hello World!", sat_token_url , fg="blue", bg='cyan')
#print      colorize(                sat_token_url , fg="blue", bg='yellow')
r = requests.post(sat_token_url, headers=sat_token_headers)
sat_token = r.json()['access_token']
#print       sat_token

# Use access token ad mac to get object value
headers = {"Authorization": "Bearer " + sat_token}
url     = "https://api.webpa.comcast.net:8090" + '/api/v2/device/' + "mac:" + mac + "/config?names=" + obj
print  colorize( url, fg="green", bg='white', opts=('underscore',) )
resp = json.loads(requests.get(url, headers=headers).text)
#print json.dumps(resp, indent=4)
print  colorize( json.dumps(resp, indent=4) , fg="magenta", bg='cyan', opts=('bold',) )

