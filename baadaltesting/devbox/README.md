Baadal Testing Devbox
===============================================
This devbox installation script is tested on Ubuntu-16.04-LTS-Server  

Execute below steps to install devbox on your system.  

1. update your machine and install some packages  
   apt-get update  
   apt-get install make  
   apt-get install firefox  

2. make devbox

3. open firefox and open baadal GUI, http://localhost/baadal  
   user:- admin  
   passwd:- baadal  

   Request for a VM in user menu.  
   VM's default user is "cirros" and password is "cubswin:)"  

4. Start background task using following script
   baadal2.0/baadalinstallation/web2py_start.sh
   
Steps to add one devbox as host of other devbox
===============================================
Note:
- Controller of only one devbox should be used. Other devbox machines should be used only as host machines to avoid data conflict. 
- VMs in devbox are created in 192.168.0.0/16 subnet. So, VMs running in one subnet cannot connect to VM running in another devbox.
- Each VM will use the DHCP Server running on its own devbox server. So, if more private IPs are added to the controller; DHCP configuration file(/etc/dhcp/dhcpd.conf) needs to be copied to other devbox machines; and DHCP server should be restarted.
  service isc-dhcp-server restart


