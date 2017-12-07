#!/usr/bin/env python
import os
from subprocess import PIPE, Popen


class SNMP(object):

	def __init__(self, device_ip):
		self.device_ip = device_ip

	def cmd_run(self, command):
		try:
			process = Popen(args = command, stdout = PIPE, shell = True)
			output = process.communicate()[0].split()
			return output[-1]
		except:
			return "No response from server"
		# return process.communicate()[0]

class WifiSettings(SNMP):

	''' Following are the snmp get and set for 2.4 Ghz radio '''
	
	def snmp_get_ssid_2g(self):
		resp = super(WifiSettings, self).cmd_run("snmpget -v2c -c hDaFHJG7 %s .1.3.6.1.4.1.17270.50.2.2.2.1.1.3.10001" % (self.device_ip))
		return resp

	def snmp_set_ssid_2g(self, ssid_2g):
		self.ssid_2g = ssid_2g
		resp = super(WifiSettings, self).cmd_run("snmpset -v2c -c hDaFHJG7 %s .1.3.6.1.4.1.17270.50.2.2.2.1.1.3.10001 s %s" % (self.device_ip, self.ssid_2g))

	def snmp_get_password_2g(self):
		resp = super(WifiSettings, self).cmd_run("snmpget -v2c -c hDaFHJG7 %s .1.3.6.1.4.1.17270.50.2.2.3.1.1.2.10001" % (self.device_ip))
		return resp

	def snmp_set_password_2g(self, password):
		self.password_2g = password
		resp = super(WifiSettings, self).cmd_run("snmpset -v2c -c hDaFHJG7 %s .1.3.6.1.4.1.17270.50.2.2.3.1.1.2.10001 s %s" % (self.device_ip, self.password_2g))

	def snmp_get_security_2g(self):
		resp = super(WifiSettings, self).cmd_run("snmpget -v2c -c hDaFHJG7 %s .1.3.6.1.4.1.17270.50.2.2.2.1.1.4.10001" % (self.device_ip))
		return resp

	def snmp_set_security_2g(self, security):
		self.security = security
		resp = super(WifiSettings, self).cmd_run("snmpset -v2c -c hDaFHJG7 %s .1.3.6.1.4.1.17270.50.2.2.2.1.1.4.10001 i %d" % (self.device_ip, self.security))
		return resp

	''' Following are the snmp get and set for 5 Ghz radio '''

	def snmp_get_ssid_5g(self):
		resp = super(WifiSettings, self).cmd_run("snmpget -v2c -c hDaFHJG7 %s .1.3.6.1.4.1.17270.50.2.2.2.1.1.3.10101" % (self.device_ip))
		return resp

	def snmp_set_ssid_5g(self, ssid_5g):
		self.ssid_5g = ssid_5g
		resp = super(WifiSettings, self).cmd_run("snmpset -v2c -c hDaFHJG7 %s .1.3.6.1.4.1.17270.50.2.2.2.1.1.3.10101 s %s" % (self.device_ip, self.ssid_2g))

	def snmp_get_password_5g(self):
		resp = super(WifiSettings, self).cmd_run("snmpget -v2c -c hDaFHJG7 %s .1.3.6.1.4.1.17270.50.2.2.3.1.1.2.10101" % (self.device_ip))
		return resp

	def snmp_set_password_5g(self, password):
		self.password_5g = password
		resp = super(WifiSettings, self).cmd_run("snmpset -v2c -c hDaFHJG7 %s .1.3.6.1.4.1.17270.50.2.2.3.1.1.2.10101 s %s" % (self.device_ip, self.password_2g))

	def snmp_get_security_5g(self):
		resp = super(WifiSettings, self).cmd_run("snmpget -v2c -c hDaFHJG7 %s .1.3.6.1.4.1.17270.50.2.2.2.1.1.4.10101" % (self.device_ip))
		return resp

	def snmp_set_security_5g(self, security):
		self.security = security
		resp = super(WifiSettings, self).cmd_run("snmpset -v2c -c hDaFHJG7 %s .1.3.6.1.4.1.17270.50.2.2.2.1.1.4.10101 i %d" % (self.device_ip, self.security))
		return resp

# class Radio(SNMP):

	''' Following are the snmp get and set for 2.4 Ghz radio '''

	def snmp_get_channel_2g(self):
		pass

	def snmp_set_channel_2g(self, channel):
		pass

	def snmp_get_bandwidth_2g(self):
		resp = super(WifiSettings, self).cmd_run("snmpget -v2c -c hDaFHJG7 %s .1.3.6.1.4.1.17270.50.2.2.7.1.1.4.10000" % (self.device_ip))
		return resp

	def snmp_set_bandwidth_2g(self, bandwidth):
		self.bandwidth = bandwidth
		resp = super(WifiSettings, self).cmd_run("snmpget -v2c -c hDaFHJG7 %s .1.3.6.1.4.1.17270.50.2.2.7.1.1.4.10000 i %d" % (self.device_ip, self.bandwidth))


	''' Following are the snmp get and set for 5 Ghz radio '''

	def snmp_get_channel_5g(self):
		pass

	def snmp_set_channel_5g(self, channel):
		pass

	def snmp_get_bandwidth_5g(self):
		resp = super(WifiSettings, self).cmd_run("snmpget -v2c -c hDaFHJG7 %s .1.3.6.1.4.1.17270.50.2.2.7.1.1.4.10100" % (self.device_ip))
		return resp

	def snmp_set_bandwidth_5g(self, bandwidth):
		self.bandwidth = bandwidth
		resp = super(WifiSettings, self).cmd_run("snmpget -v2c -c hDaFHJG7 %s .1.3.6.1.4.1.17270.50.2.2.7.1.1.4.10100 i %d" % (self.device_ip, self.bandwidth))



# wifi = WifiSettings("10.255.244.45")

# # radio = Radio("10.255.244.45")
# x = wifi.snmp_get_ssid_5g()
# print "My output : ", x
# y = wifi.snmp_get_password_5g()
# print y
# z = wifi.snmp_set_password_2g("password2")
# print z
# a = wifi.snmp_get_password_2g()
# print a
# b = wifi.snmp_get_security_5g()
# print b
# c = wifi.snmp_set_security_2g(1)
# print c
# d = wifi.snmp_get_security_2g()
# print d
