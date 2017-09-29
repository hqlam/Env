import requests
import json
import argparse
from requests.exceptions import ConnectionError

requests.packages.urllib3.disable_warnings()

cert_path = './client_new.pem'
#cert_path = '/etc/xpc/xpc_client.pem'

flavor = {
	"amber" :  "96.119.228.186",             # Amber HAP
	#"perf" :   "96.118.60.80",              # Perf HAP
	"red" :    "red.awsxpc.comcast.net",     # Red HAP
	"green" :  "xpcapi-si.xpc.comcast.net",  # Green HAP
	"yellow" : "96.119.225.209",             # Yellow HAP
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

if __name__ == '__main__':

	parser = argparse.ArgumentParser(description="Check and remove cpe from environment")
	parser.add_argument('--cpe', dest = "cpe", required = True, type = str, help = "cpe mac to check")
	#parser.add_argument('--env', dest = "env", nargs = '+', type = str, help = "environment name eg, amber, red, yellow, green")
	args = parser.parse_args()
	cpe = args.cpe.upper()
	#env = args.env
	found = []
	for k in flavor:
		print "Checking in %s environment" % k
		try:
			check = check_association(flavor[k], cpe)
			if check['status'] == 200:
				found.append(k)
			print "================================"
		except ConnectionError:
			print "Environment not reachable"
	print "*** CPE FOUND IN *** ", found

	prompt = "which environment you want to delete your CPE : "
	environment = raw_input(prompt).split(" ")
	#print environment
	
	for e in environment:
		if e not in flavor:
			print "%s is invalid environment" % e
		elif e not in found:
			print "%s not found in %s environment" % (cpe, e)
		else:
			print "You choose to remove %s from %s environment" % (cpe, e)
			del_cpe = delete_cpe(flavor[e], cpe)
			if del_cpe['status'] == 400:
				configset = check_association(flavor[e], cpe)['data']['xpc_csid']
				detach = delete_association(flavor[e], configset, cpe)
				del_cpe = delete_cpe(flavor[e], cpe)
				print "%s is removed from %s environment" % (cpe, e)
			else:
				print "%s is removed from %s environment" % (cpe, e)


				

