
![Logo](https://static.wikia.nocookie.net/windows/images/a/a1/Windows_rgb_Blue_D.png)

# Bonus

#### We are asked to Create a third environment called “POC” in which we must use Windows servers and deploy the application using Ansible


## Setting up the windows servers(s)

In order for us to be able configuring the servers using ansible we first need to make sure to do some steps on the windows server(s)
<img src="https://avatars.githubusercontent.com/u/10924345?v=4" width="120" height="100" />

setting up winrm:
- Use PowerShell and type ```winrm qc -force```
- Run ```winrm enumerate winrm/config/listener``` nake sure http is open
- After that ```winrm set winrm/config/service/auth '@{Basic="true"}'``` to make sure basic becomes true and cbthardeninglevel is relaxed
- Enable communication via http by using ``` winrm set winrm/config/service '@{AllowUnencrypted="true"}' ```
- After that fo to windows -> search -> compmgmt.msc use compmgmt.msc (Shortcut for Computer Management Snippet) and make a new user "ansible" with password you remmember and check "password never expires"
- Make the new "ansible user an admin by clicking on it and go to "Member of" tab
- After that type ``` netsh advfirewall firewall add rule name="WinRM 5985" dir=in action=allow protocol=TCP localport=5985```
- And ```netsh advfirewall firewall add rule name="WinRM 5985" dir=out action=allow protocol=TCP localport=5985```
- You can run ```winrs -r:http://machineip:5985/wsman -u:ansible -p:ansible_pass ipconfig/all``` to check if remote shell is all good
- You can telenet from your ansible machine with port 5985 to your windows machine and see the connection
- use the ansible ping module to check if everything is connected
- Run you play book

#### playbook run is just the same as before, however make sure to learn about how to connect with password as well.

make sure to have this vars for your playbook - explained in base project documintation.



| Variable | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `node_install_folder` | `string` | **Required**. path to the location you download and install node v14 |


| Variable  | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `web_app_folder`      | `string` | **Required**. path to the web app folder should be c:\bootcamp |


|  Variable  | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `ansible_install_folder`      | `string` | **Required**. the path of the ansible installation" |

enjoy.

### Big thanks to Ben Asulin who is a master of windows servers and had guided me and explained how to configure the windows machine
