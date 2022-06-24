
# Ansible week six project

In this project we are going to write an Ansible playbook(s) to configure the servers created by terraform and then, install the NodeWeightTracker application (including all its dependencies). In addition, after everything we did so far we are ready to move to production. To achieve this we will need to provision 2 identical environments, one for staging and another for production.


![Logo](https://bootcamp.rhinops.io/images/ansible.gif)


## How to use:

First clone this repo to the machine you are going to run ansible on. You will need to setup in inventory file or inventory and config file.
In this file(s) you need to have you connection options and variables. make sure you have all the variables names right and that you have the vars for each of the host groups.







### example of inventory file style INI

```yml
[staging]
server1
server2
...
[staging:vars]
varibale1=value
varibale2=value
varibale3=value

[production]
server1
server2
...
[production:vars]
varibale1=value
varibale2=value
varibale3=value
```
### Variables


(make sure you have them for staging and production separately)

| Variable | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `user` | `string` | **Required**. destination machine user name |


| Variable  | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `local_user`      | `string` | **Required**. the user name of the local machine |


|  Variable  | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `local_env_folder`      | `string` | **Required**. the path of the .env file without "/home/local_user/" |


## How to use?

## **Install ansible**
```
 sudo apt update
 sudo apt install software-properties-common
 sudo add-apt-repository --yes --update ppa:ansible/ansible
 sudo apt install ansible -y
 ```

## **Connect the controller (machine)  to the nodes**
###  `cd ~/.ssh`
###  `nano id_rsa` (copy the private key here)
###  `chmod 400 id_rsa` (read only)
###  Create a file called inventory:
```
[staging]
vm1-stage ansible_port=221 ansible_host={your-node-vm-ip} ansible_user={your-vm--username}
vm2-stage ansible_port=222 ansible_host={your-node-vm-ip} ansible_user={your-vm-username}
vm3-stage ansible_port=223 ansible_host={your-node-vm-ip} ansible_user={your-vm-username}

[production]
vm1-pro ansible_port=221 ansible_host={your-node-vm-ip} ansible_user={your-vm-username}
vm2-pro ansible_port=222 ansible_host={your-node-vm-ip} ansible_user={your-vm-username}
vm3-pro ansible_port=223 ansible_host={your-node-vm-ip} ansible_user={your-vm-username}

```
### Create a file called ansible.cfg:
```
[defaults]
inventory = inventory
private_key_file = ~/.ssh/id_rsa
```

###  Check the connection: `ansible all -i inventory -m ping`








