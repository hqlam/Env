import requests
import json
import argparse
from requests.exceptions import ConnectionError

requests.packages.urllib3.disable_warnings()
headers = {'Content-Type' : 'application/json'}
cert_path = './client_new.pem'
#cert_path = '/etc/xpc/xpc_client.pem'

flavor = {
	"amber" :  "96.119.228.186",              # Amber HAP
	"perf" :   "96.118.60.80",                # Perf HAP
	"red" :    "red.awsxpc.comcast.net",      # Red HAP
	"green" :  "xpcapi-si.xpc.comcast.net",   # Green HAP
	"yellow" : "96.119.225.209",              # Yellow HAP
	"blue" :   "xpclb-wc-01q.sys.comcast.net" # Blue Staging HAP
	}

def check_association(env, cpe):
	url = 'https://' + env + '/api/v1/gateway-cpe/' + cpe + '/association'
	print url
	resp = json.loads(requests.get(url, cert = cert_path, verify = False).text)
	return resp

def delete_association(env, configset, cpe):
	url = 'https://' + env + '/api/v1/gateway-configset/' + configset + '/gateway-cpe/' + cpe + '/association'
	#print url
	resp = json.loads(requests.delete(url, cert = cert_path, verify = False).text)
	return resp

def delete_cpe(env, cpe):
	url = 'https://' + env + '/api/v1/gateway-cpe/' + cpe
	resp = json.loads(requests.delete(url, cert = cert_path, verify = False).text)
	return resp

def create_csid(env, cpe):

	url = 'https://' + env + '/api/v1/gateway-configset'
	resp = json.loads(requests.post(url, cert = cert_path, verify = False, headers=headers).text)
	print resp
	return resp



def onboard(env, cpe):
	csid = create_csid(env, cpe)['data']['xpc_csid']
	url = 'https://' + env + '/api/v1/gateway-configset/' + csid + '/gateway-cpe/' + cpe + '/configset?action=apply_and_associate'
	resp = json.loads(requests.post(url, cert = cert_path, verify = False).text )
	return resp


if __name__ == '__main__':

	parser = argparse.ArgumentParser(description="Check and onboard cpe to environment")
	parser.add_argument('--cpe', dest = "cpe", required = True, type = str, help = "cpe mac to check")
	parser.add_argument('--env', dest = "env", required = True, type = str, help = "environment name eg, amber, red, yellow, green")
	args = parser.parse_args()
	cpe = args.cpe.upper()
	env = args.env.lower()

	resp = onboard(flavor[env], cpe)
	print resp
	if resp['status'] == 200:
		print json.dumps(resp, indent=4), "\nOnboarded the CPE successfully"
				

