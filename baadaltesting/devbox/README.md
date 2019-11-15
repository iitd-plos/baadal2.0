Baadal Testing Devbox
===============================================
This devbox installation script is tested on Ubuntu-16.04-LTS-Server  

### Steps to install devbox on your system.  
1. Update the local package index and install some required packages  
   ```bash
   apt update  
   apt install make firefox
   ```

2. Excute following command to start devbox installation
   ```bash
   make devbox
   ```

3. Start background task by executing following script
   ```bash
   baadal2.0/baadalinstallation/web2py_start.sh
   ```
4. Start firefox and open baadal web interface, http://localhost/baadal  
   user:- admin  
   passwd:- baadal  

   * Goto **USER MENU > Request VM** to request for a VM.
   * Goto **ADMIN MENU > All Pending Requests** to approve the request.
   * VM's default user is "cirros" and password is "cubswin:)"  
   * Default password for Web2py Web Framework is **web2py**<br/>In case of exception, you would be required to enter the password to check the error traceback.


   
### How to add one devbox as host of other devbox machine
**Note**
- Controller of only one devbox should be used. Other devbox machines should be used only as host machines to avoid any data conflict. 
- VMs in devbox are created in 192.168.0.0/16 private subnet. So, VMs running on one devbox cannot connect to VM running in another devbox.
- Controller devbox machine will be referred to as controller & all other devbox machines will be referred to as hosts henceforth.
- Each VM will use the DHCP Server running on its own devbox server. So, if private IPs(other than host IPs) are added to the controller; DHCP configuration file(/etc/dhcp/dhcpd.conf) on controller needs to be copied to other host machines; and DHCP server should be restarted using following command.
```bash
service isc-dhcp-server restart
```


**Steps**

1. There should be common datastores on all machines to facilitate VM migration. To mount Controller datastore on other machines, edit **/etc/exports** to give permission to host IPs. Sample edited entry will be as follows:
   ```bash
   /baadal/data 10.17.0.0/16(rw,sync,no_root_squash,no_all_squash,subtree_check)
   ```
2. Edit **/etc/fstab** on host machines to mount file from controller datastore. Sample edited entry will be as follows:

   ```bash
   10.17.6.41:/baadal/data /mnt/datastore nfs rw,auto
   ```
3. Use **mount -a** to mount the datastore on host machines

4. Passwordless ssh connection should be configured between controller and host machines; and also between host machines for migration. Execute following command on Controller. HOST_IP should be replaced with actual IP
   ```bash
   ssh-copy-id root@HOST_IP
   su - www-data
   ssh-copy-id root@HOST_IP
   ```
   Execute following command on Host machines for each host including controller.
   ```bash
   ssh-copy-id root@CONTROLLER_IP
   ```

5. Login to baadal web interface. Goto **ADMIN MENU > Configure System > Configure Private IP Pool**. Add entry of private ip and mac address of host machines in vlan0.

6. Goto **ADMIN MENU > Configure System > Configure Host**. Enter the host machine IP, and Click **Get Details** . Host Configuration details should get populated. Host can then be added to the system.
