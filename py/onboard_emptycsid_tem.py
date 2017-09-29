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

# # 1/2: extract the csid
# api       = '/api/v1/gateway-configset'
# url       = "http://" + host  + api 
# print url
# resp = json.loads(requests.post(url,cert = cert_path,verify = False).text)
# csid   = resp["data"]["xpc_csid"]

# 1/2 generate new empty csid
api       = '/api/v1/gateway-configset'
url       = "http://" + host  + api 
print url
resp = json.loads(requests.post(url,cert = cert_path,verify = False).text)
csid   = resp["data"]["xpc_csid"]

# 2/2: onboarding the csid
api    = '/api/v1/gateway-configset/'
action = '/configset?action=apply_and_associate'
url    = "http://" + host + api + csid + '/gateway-cpe/' + mac + action
print url
resp = json.loads(requests.post(url,cert = cert_path,verify = False).text)

# verify
if resp['status'] == 200:
    print "\nOnboarded the CPE successfully"
print  json.dumps(resp, indent=4)

# #hlam001c@cacsvlo-16686:~$ py onboard.py 10868CEA6D24
# http://96.119.227.212:8080/api/v1/gateway-configset
# http://96.119.227.212:8080/api/v1/gateway-configset/80718d56-4556-4d9c-ab0e-b40e7bc48b6a/gateway-cpe/10868CEA6D24/configset?action=apply_and_associate
# {
#     "status": 200, 
#     "message": "Apply and associate to configset to cpe successfully", 
#     "data": {
#         "group_cpe_information": {
#             "sw_version": "TG1682_2.4s7_PROD_sey", 
#             "vendor": "ARRIS Group, Inc.", 
#             "firmware_name": "TG1682_2.4s7_PROD_sey", 
#             "serial_number": "F8SBUT79B988845", 
#             "hw_version": "9.0", 
#             "model_name": "XB3"
#         }, 
#         "group_private_wifi_configuration": {
#             "wifi_passphrase_2g": "P8ssword", 
#             "ssid_name_5g": "wf_cpro_24", 
#             "wifi_security_5g": 4, 
#             "broadcast_ssid_2g": true, 
#             "ssid_enabled_5g": true, 
#             "ssid_enabled_2g": true, 
#             "ssid_name_2g": "wf_cpro_24", 
#             "broadcast_ssid_5g": true, 
#             "wifi_security_2g": 4, 
#             "wifi_passphrase_5g": "P8ssword"
#         }, 
#         "group_radio_2g_configuration": {
#             "channel_width": 1, 
#             "extension_channel": "Auto", 
#             "auto_channel_enabled": true, 
#             "min_basic_rate": 1, 
#             "tx_power": 1, 
#             "dfs_enabled": false, 
#             "radio_enabled": true, 
#             "operating_standards": "g,n", 
#             "channel": 11
#         }, 
#         "group_radio_5g_configuration": {
#             "channel_width": 3, 
#             "extension_channel": "Auto", 
#             "auto_channel_enabled": true, 
#             "min_basic_rate": 1, 
#             "tx_power": 1, 
#             "dfs_enabled": false, 
#             "radio_enabled": true, 
#             "operating_standards": "a,n,ac", 
#             "channel": 48
#         }
#     }
# }
# hlam001c@cacsvlo-16686:~$ py check_association.py 10868CEA6D24
# {
#     "status": 200, 
#     "message": "Success Message", 
#     "data": {
#         "xpc_csid": "80718d56-4556-4d9c-ab0e-b40e7bc48b6a"
#     }
# }


