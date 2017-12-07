#!/usr/bin/env python

# Given a MAC and 
#       host IP of 2d or 4d core, 
# generate new CSID and associate it, Onboarding.
# process needs a valid certificate
import os,sys, requests, json
from requests.exceptions import ConnectionError
requests.packages.urllib3.disable_warnings()

cert_path = './client.pem'
mac       = sys.argv[1]
host      = sys.argv[2] + ":8080"
csid      = sys.argv[3]

# onboarding the CPE mac to the ENV host with the csid
api    = '/api/v1/gateway-configset/'
action = '/configset?action=apply_and_associate'
url    = "http://" + host + api + csid + '/gateway-cpe/' + mac + action
print url
resp = json.loads(requests.post(url,cert = cert_path,verify = False).text)

# verify
if resp['status'] == 200:
    print "\nOnboarded the CPE successfully"
print  json.dumps(resp, indent=4)



