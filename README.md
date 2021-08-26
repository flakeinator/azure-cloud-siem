# azure-cloud-siem
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/flakeinator/azure-cloud-siem/blob/main/Diagrams/Azure%20Network%20Diagram%20for%20Elk%20Server.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Ansible files may be used to install only certain pieces of it, such as Filebeat.

Here are the link to the playbook files that were used. They are kept separate as part of the learning process in the class but can be combined into a single playbook. This also contains the host and config files.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
- Beats in Use
- Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

-    What aspect of security do load balancers protect? What is the advantage of a jump box?

The load balancer will help protect against a DDOS attack and ensure that there is maximum up-time for the webservers. The jump box provides a single point of access to the internal network and ensures that there is only a single server that needs to be updated with security rules to gain internal access to the servers.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file system and system metrics.
- What does Filebeat watch for? 
Filebeat monitors the logfiles or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.
-  What does Metricbeat record? 
Metricbeat will monitor and record the system-level functions of your hosts. These includes system-level CPU usage, memory, file system, disk IO, and network IO statistics, as well as top-like statistics for every process running on your systems.

The configuration details of each machine may be found below.

| Name         | Function     | IP Address | Operating System |
|--------------|--------------|------------|------------------|
| Jump Box     | Gateway      | 10.0.0.4   | Linux            |
| Web-1 | Webserver    | 10.0.0.5   | Linux            |
| Web-2 | Webserver    | 10.0.0.6   | Linux            |
| Elk Server   | Elasticstack | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jump box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- My Public IP – not listed for obvious reasons

Machines within the network can only be accessed by SSH.
The jump box is the only machine that is allowed to access the Elk VM. The Elk VM has a private IP of 10.1.0.4 since it is on a different network compared to the rest of the servers.

A summary of the access policies in place can be found in the table below.


|     Name    | Publicly Available |       Allowed IP Addresses       |
|:-----------:|:------------------:|:--------------------------------:|
|   Jump Box  |         No         |           My Public IP           |
|    Web-1    |         No         |           My Public IP           |
|    Web-2    |         No         |           My Public IP           |
|  Elk Server |         No         |           My Public IP           |
|   Filebeat  |         No         | 10.1.0.4, My Public IP, 10.0.0.4 |
|  Metricbeat |         No         | 10.1.0.4, My Public IP, 10.0.0.4 |
|   Ansible   |         No         | Directly through the Jump Box VM |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it eliminates human error and ensures that everything is the same each time. It also allows the filers to be shared with anybody and they can do the installs with the same results.

The playbook implements the following tasks:
•    After setting the host file with the proper group (elk) the script will install the following for the Elk server.
•    Docker.io will be installed first. If it is already present on the machine it will be skipped.
•    The next thing that will be installed is python3. If it is already present on the machine it will be skipped.
•    The docker module will be installed and if already present will be skipped.
•    The next thing that is done is to increase the virtual memory. Without this step, the Elk server will crash.
•    The next item is a shell module to ensure that upon restart the memory is set properly to prevent crashing.
•    The next last step is to download and install the docker elk container.
•    The final step is to enable the docker service on reboot.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/flakeinator/azure-cloud-siem/blob/main/Ansible/Docker%20ps%20command%20results.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
Web-1 – 10.0.0.5
Web-2 – 10.0.0.6

We have installed the following Beats on these machines:
•    Filebeat
•    Metricbeat

These Beats allow us to collect the following information from each machine:
•    Filebeat – This is collecting log files for any of the specified modules and then sending that information over to the Kibana server for analysis.
•    Metricbeat – This is collecting information about the web servers. This information includes but is not limited to CPU and memory usage, process, and file system levels.


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Keep the file structure that is currently in place for all files. This will ensure that the scripts run correctly and can find and install the proper files. Everything should be placed into the /etc/ansible/ directory.
- Update the hosts file to include the IP address(es) of your webserver(s) and elk server(s) to ensure the correct things are installed on the proper machines. There are headings for both already listed and the IP addresses (or hostname) needs to be changed/updated.
- Run the playbook, and navigate to http://[Elk server IP]:5601/app/kibana#/home to check that the installation worked as expected. If it worked, you will get the main page for Kibana. If it didn’t load/install correctly, the connection will time out.

Some of the commands that will be needed:

To run the ansible file – ansible-playbook <name of playbook>
To update any of the files – nano <filename>
To download the files – The wget command can be used to download the files.
