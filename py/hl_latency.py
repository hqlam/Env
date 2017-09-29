#!/usr/local/bin/python2.7

import sys, requests, json, time
from requests.exceptions import ConnectionError
requests.packages.urllib3.disable_warnings()

mac = sys.argv[1]
host = 'http://96.119.224.255:8080'
cert_path = './client.pem'

api = '/api/v1/gateway-cpe/'
url = host + api + mac + '/association'
resp = json.loads(requests.get(url,cert = cert_path,verify = False).text)

if resp['status'] == 200:
    csid = resp['data']['xpc_csid']
    print csid

api = '/api/v1/gateway-configset/'

wifi_get_group = '/configuration?group_id=group_private_wifi_configuration&fetch=True'
wifi_post_group = '/configuration?group_id=group_private_wifi_configuration'
wifi_get = host + api + csid + wifi_get_group 
wifi_post = host + api + csid + wifi_post_group 

radio2g_get_group = '/configuration?group_id=group_radio_2g_configuration&fetch=True'
radio2g_post_group = '/configuration?group_id=group_radio_2g_configuration'
radio2g_get = host + api + csid + radio2g_get_group 
radio2g_post = host + api + csid + radio2g_post_group 

radio5g_get_group = '/configuration?group_id=group_radio_5g_configuration&fetch=True'
radio5g_post_group = '/configuration?group_id=group_radio_5g_configuration'
radio5g_get = host + api + csid + radio5g_get_group 
radio5g_post = host + api + csid + radio5g_post_group 

lan_get_group = '/configuration?group_id=group_private_lan_configuration&fetch=True'
lan_post_group = '/configuration?group_id=group_private_lan_configuration'
lan_get = host + api + csid + lan_get_group 
lan_post = host + api + csid + lan_post_group 

lan_data1 = {
"ip_address": "192.168.1.8",
"netmask": "255.255.255.0",
"dhcp_start_ip_address": "192.168.1.5",
"dhcp_end_ip_address": "192.168.1.20",
"dhcp_lease_length": 86400,
"dhcp_server_enabled": True
}

lan_data2 = {
"ip_address": "192.168.1.1",
"netmask": "255.255.255.0",
"dhcp_start_ip_address": "192.168.1.5",
"dhcp_end_ip_address": "192.168.1.20",
"dhcp_lease_length": 86400,
"dhcp_server_enabled": True
}

radio2g_data1 = {
"radio_enabled": True,
"channel": -1,
"channel_width": 1,
"operating_standards": "g,n",
"tx_power" : 5,
"beacon_interval" : 100,
"min_basic_rate" : 1
}

radio2g_data2 = {
"radio_enabled": True,
"channel": -1,
"channel_width": 1,
"operating_standards": "g,n",
"tx_power" : 1,
"beacon_interval" : 100,
"min_basic_rate" : 1
}

radio5g_data1 = {
"channel_width": 3,
"channel": 48,
"tx_power": 1,
"radio_enabled": True,
"operating_standards": "a,n,ac",
"min_basic_rate": 1
}

radio5g_data2 = {
"channel_width": 3,
"channel": 36,
"tx_power": 1,
"radio_enabled": True,
"operating_standards": "a,n,ac",
"min_basic_rate": 1
}

wifi_data1 = {"ssid_name_2g":  "xb6_2g_test1",
"wifi_passphrase_2g": "xb6_2g_test1",
"ssid_name_5g":  "xb6_5g_test1",
"wifi_passphrase_5g":  "xb6_5g_test1",
"wifi_security_2g": 2,
"wifi_security_5g": 2
}

wifi_data2 = {"ssid_name_2g":  "xb6_2g_test2",
"wifi_passphrase_2g": "xb6_2g_test2",
"ssid_name_5g":  "xb6_5g_test2",
"wifi_passphrase_5g":  "xb6_5g_test2",
"wifi_security_2g": 2,
"wifi_security_5g": 2
}

gets = [wifi_get, radio2g_get, radio5g_get, lan_get]
posts = [wifi_post, radio2g_post, radio5g_post, lan_post]


#### Latency data for gets

print 'Latency data for gets'
rep = open('report.html','w')
rep.write('<head><style>table,td {border: 1px solid black;border-collapse:collapse;}td {padding: 5px;textalign: left;}</style></head>')

rep.write('<br><p> Latency Report for GETs </p><br>')
rep.write('<table>')

rec = '<tr>row</tr>'
row = '<td>duration</td>'

for url in gets:
    print url
    row2=''
    if 'wifi' in url:
        row1 = row.replace('duration', 'PRIVATE WIFI GET') 
        row2 = row2 + row1
    if 'radio_2g' in url:
        row1 = row.replace('duration', 'RADIO2G GET') 
        row2 = row2 + row1
    if 'radio_5g' in url:
        row1 = row.replace('duration', 'RADIO5G GET') 
        row2 = row2 + row1
    if 'lan' in url:
        row1 = row.replace('duration', 'PRIVATE LAN GET') 
        row2 = row2 + row1
#    if 'moca' in url:
#        row1 = row.replace('duration', 'MOCA MODE GET')
#        row2 = row2 + row1
#    if 'bridge' in url:
#        row1 = row.replace('duration', 'BRIDGE MODE GET')
#        row2 = row2 + row1
    count = 0
    while count < 50:
        start = time.time()
        resp = json.loads(requests.get(url,cert = cert_path,verify = False).text)
        if resp['status'] == 200:
            duration = str(time.time() - start)[:4]
            print duration
            row1 = row.replace('duration', duration)
            row2 = row2 + row1
        else:
	    print 'Fail'
            row1 = row.replace('duration', 'Fail')
            row2 = row2 + row1
        time.sleep(15)
        count += 1
    rec1 = rec.replace('row',row2)
    rep.write(rec1)
rep.write('</table>')
rep.write('<br><p> Latency Report for POSTs </p><br>')
rep.write('<table>')


#### Latency data for posts

print '------------------------------------------'
print 'Latency data for posts'

for url in posts:
    print url
    row2=''
    if 'wifi' in url:
        data1, data2 = wifi_data1, wifi_data2
        row1 = row.replace('duration', 'PRIVATE WIFI POST') 
        row2 = row2 + row1
    if 'radio_2g' in url:
        data1, data2 = radio2g_data1, radio2g_data2
        row1 = row.replace('duration', 'RADIO2G POST') 
        row2 = row2 + row1
    if 'radio_5g' in url:
        data1, data2 = radio5g_data1, radio5g_data2
        row1 = row.replace('duration', 'RADIO5G POST') 
        row2 = row2 + row1
    if 'lan' in url:
        data1, data2 = lan_data1, lan_data2
        row1 = row.replace('duration', 'PRIVATE LAN POST') 
        row2 = row2 + row1
#    if 'moca_mode' in url:
#        data1, data2 = .....radio5g_data1, radio5g_data2
#        row1 = row.replace('duration', '.....RADIO5G POST')
#        row2 = row2 + row1
#    if 'bridge_mode' in url:
#        data1, data2 = .....radio5g_data1, radio5g_data2
#        row1 = row.replace('duration', '.....RADIO5G POST')
#        row2 = row2 + row1

    count = 0
    while count < 25:
        start = time.time()
        resp = json.loads(requests.post(url,json=data1,cert = cert_path,verify = False).text)
        if resp['status'] == 200:
            duration = str(time.time() - start)[:4]
            print duration
            row1 = row.replace('duration', duration)
            row2 = row2 + row1
        else:
	    print 'Fail'
            row1 = row.replace('duration', 'Fail')
            row2 = row2 + row1
        time.sleep(30)

        start = time.time()
        resp = json.loads(requests.post(url,json=data2,cert = cert_path,verify = False).text)
        if resp['status'] == 200:
            duration = str(time.time() - start)[:4]
            print duration
            row1 = row.replace('duration', duration)
            row2 = row2 + row1
        else:
	    print 'Fail'
            row1 = row.replace('duration', 'Fail')
            row2 = row2 + row1
        time.sleep(30)
        count += 1
    rec1 = rec.replace('row',row2)
    rep.write(rec1)

rep.write('</table>')
rep.close()
