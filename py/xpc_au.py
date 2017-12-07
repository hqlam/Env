#!/usr/bin/env python
import requests
import json
import slumber

requests.packages.urllib3.disable_warnings()

cert_path = '/Users/aubale200/Desktop/work/smart_internet/sslcert/client.pem'

#server = "http://96.119.99.101/api/v1/"
configset_data = {
    		"group_private_wifi_configuration": {
		        "ssid_name_2g":"2gTest_SSID_Name",
		        "wifi_passphrase_2g":"2gtestssid2345",
		        "wifi_security_2g": 2,
			    "ssid_enabled_2g": True,
			    "broadcast_ssid_2g": True,
			    "ssid_name_5g":"5gTest_SSID_Name",
		        "wifi_passphrase_5g":"5gtestssid2345",
		        "wifi_security_5g": 2,
		        "ssid_enabled_5g": True,
		     	"broadcast_ssid_5g": True
    		},
 			"group_private_lan_configuration": {
               "ip_address": "192.168.1.1",
               "netmask": "255.255.255.0",
               "dhcp_start_ip_address": "192.168.1.5",
               "dhcp_end_ip_address" : "192.168.1.20",
               "dhcp_lease_length": 604800
           }
	}

headers = {'Content-Type': 'application/json'}


class XPC(object):

	def __init__(self, mac, server):
		self.cpe = mac
		self.server = server

	''' GET and POST using requests module '''
	def get_api(self, url):
		self.url = url
		resp = json.loads(requests.get(self.url, cert = cert_path, verify = False).text)
		return resp

	def post_api(self, url, data):
		self.url = url
		self.data = data
		resp = requests.post(self.url, data = json.dumps(self.data), headers = headers, cert = cert_path, verify = False).status_code
		return resp

	''' GET and POST using slumber module '''

	def get_api_s(self, url):
		pass

	def get_configset(self):
		
		resp = json.loads(requests.get(self.server + 'gateway-cpe/' + self.cpe + '/association', cert = cert_path, verify = False).text)
		print resp
		#print resp
		# if 'xpc_csid' in resp["data"]:
		# 	#return resp["data"]['xpc_csid']
		if 'data' in resp:
			return resp["data"]["xpc_csid"]
		else:
			return None

	def create_configset(self, data):

		self.data = data
		url = self.server + 'gateway-configset'
		configset_resp = requests.post(url, data = json.dumps(self.data), headers = headers, cert = cert_path, verify = False)
		if configset_resp.status_code == 200:
			return json.loads(configset_resp.text)["data"]["xpc_csid"]
		else:
			return None

	def apply_and_associate(self, configset_id):
		self.configset_id = configset_id
		resp = requests.post(self.server + 'gateway-configset/' + self.configset_id + '/gateway-cpe/' + self.cpe + '/configset?action=apply_and_associate', data = {}, headers=headers, cert = cert_path, verify = False)
		return resp.status_code

	def get_sync_history(self):
		resp = json.loads(requests.get(self.server + 'gateway-cpe/' + self.cpe + '/sync_info', cert = cert_path, verify = False).text)
		return resp

# x = XPC("14CFE2146E92", "http://96.119.99.101/api/v1/")
# if x.get_configset():
# 	print "Attached"
# else:
# 	print "Not attached"
#y = x.create_configset(data=configset_data)
#print y


