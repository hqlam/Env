#!/usr/bin/python2.7

# Given a MAC and 
#       host IP of 2d or 4d core, 
#       an existing csid (was with cpe1)
# Onboarding, via action aaa
# process needs a valid certificate. ./client.pem
import sys, requests, json
from requests.exceptions import ConnectionError
requests.packages.urllib3.disable_warnings()

sys.path.append("../../..")

cert_path = './client.pem'
new_mac       = sys.argv[1]
host      = sys.argv[2] + ":8080"

# input with an existing csid (was with cpe1)
csid      = sys.argv[3]

# onboarding the csid: aaa the csid and new_mac of new cpe2 
api    = '/api/v1/gateway-configset/'
action = '/configset?action=apply_and_associate'
url    = "http://" + host + "/api/v1/gateway-configset/" + csid + '/gateway-cpe/' + new_mac + "/configset?action=apply_and_associate"
#url   = "http://" + host + api + csid + '/gateway-cpe/' + new_mac + action
print url
resp = json.loads(requests.post(url,cert = cert_path,verify = False).text)

# verify
if resp['status'] == 200:
    print "\nOnboarded the CPE successfully"
print json.dumps(resp, indent=4)
