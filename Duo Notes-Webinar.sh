#Install Duo on Linux (Ubuntu)
https://duo.com/docs/authproxy-reference
apt-get install build-essential libffi-dev perl zlib1g-dev
wget  https://dl.duosecurity.com/duoauthproxy-latest-src.tgz.
tar xzf duoauthproxy-6.0.2-src.tgz
cd duoauthproxy-version-src
cd duoauthproxy-6.0.2-src
make
cd duoauthproxy-build
./install

#Duo Configuration file path
cd /opt/duoauthproxy/conf
/opt/duoauthproxy/conf/authproxy.cfg
/opt/duoauthproxy/bin/authproxyctl start
cd /opt/duoauthproxy/bin/authproxyctl

#Example of Authentication Proxy file (AuthProxy.cfg)
[cloud]
ikey=DIDJB6PEAKEG9CQQDLXZ
skey=skey_from Duo
api_host=api_From_Dup.duosecurity.com

service_account_username=ADUser@Domainname
service_account_password=ADPassword

[sso]
rikey=RILWDQ0YXN9N75JD9A0N
service_account_username=ADUser@Domainname
service_account_password=ADPassword

[ad_client] 
host=AD_IPaddress                                                  
service_account_username=AdminADUser     
service_account_password=Admin_Password
search_dn=DC=ciscoise,DC=lab          

[radius_server_auto]
ikey=ikey_from_Duo_Portal_forISE                                
skey=skey_rom_Duo_Portal_forISE                                
api_host=api-fromDuo.duosecurity.com                            
radius_ip_1=ISE_IPAddress                                
radius_secret_1=Cisco123                                                             
failmode=safe
client=ad_client                                    
port=1812


#Every change on config file needs a Duo service reboot
/opt/duoauthproxy/bin/authproxyctl restart

#ProxyLogs and debug command
cd /opt/duoauthproxy/log/
cat authproxy.log
tail -f /opt/duoauthproxy/log/authproxy.log