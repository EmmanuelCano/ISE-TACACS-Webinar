reload in 0:15 #In Global mode
!
aaa-server ISE protocol tacacs+
aaa-server ISE (outside) host ISE_IPAddress
 key Webinar123
!
#Test Authentication
test aaa authentication ISE host ISE_IP_Address username asauser password Cisco123
!
#Configure Authorization and point SSH to ISE server first
no aaa authentication ssh console LOCAL
aaa authentication ssh console ISE LOCAL
aaa authorization exec authentication-server auto-enable
aaa authorization command ISE 


