This command makes the device to reboot after the time defined, in this case It will be rebooted after 15 minutes (hours:minutes). This needs to be configured in Global configuration Mode.
reload in 0:15
!
aaa new-model
aaa authentication login AUTHEN_via_TACACS group demoTG local
aaa authentication enable default group AUTHEN_via_TACACS 
aaa authorization exec default group demoTG if-authenticated
aaa authorization exec Author-Exec_via_TACACS group demoTG local
username admin privilege 15 secret cisco123
!
tacacs server ise-1
address ipv4 ISE_IP_Address
key Cisco123
!
aaa group server tacacs+ demoTG
server name ise-1
!
aaa accounting exec default start-stop group demoTG
aaa accounting connection default start-stop group  demoTG
!aaa accounting commands 1 default start-stop group demoTG
!aaa accounting commands 7 default start-stop group demoTG
aaa accounting commands 15 default start-stop group demoTG
!
line vty 0 4
authorization exec Author-Exec_via_TACACS
login authentication AUTHEN_via_TACACS
!
aaa authorization commands 1 default group demoTG local 
aaa authorization commands 7 default group demoTG local 
aaa authorization commands 15 default group demoTG local 
aaa authorization config-commands
!

Step 3: Review traffic flow

1.	Test Command: 
test aaa group demoTG User1 Cisco123 new-code

2.	Debugs commands:
debug aaa authentication
debug aaa authorization
debug tacacs

Reload cancel
