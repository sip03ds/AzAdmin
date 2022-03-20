# Rsyslog for Sentinel
## A redundant & robust Rsyslog Server for ingesting logs to sentinel
### Needs 
Sentinel relies on Linux Rsyslog server for capturing data from various firewall solutions (checkpoint - fortigate - darktrace).

Our task is to build a fully redundant [virtual machine scale set](https://docs.microsoft.com/en-us/azure/virtual-machine-scale-sets/overview) that can scale up or down on Azure and will host an RSYSLOG server and dispatch the data to Sentinel

We will have to create different log files on every RSYSLOG server (vm on scaleset) for each vendor that dispathces data (e.g. fortinet) by tweaking rsyslog.conf file. 

Rsyslog server will have to forward specific log files on docker image. The docker image will use the logs for Microsoft's Cloud App Security ([CASB](https://en.wikipedia.org/wiki/Cloud_access_security_broker)) for [discovering](https://docs.microsoft.com/en-us/defender-cloud-apps/discovery-docker-ubuntu-azure?tabs=centos) new applications on CASB.    

The scale set will need an [OMS agent](https://github.com/microsoft/OMS-Agent-for-Linux) for dispatching the logs to the log analytics workspace that Sentinel is using. 

The scale set will need to be part of a configuration management system where all conf files will be hosted and persisted. 

### Breaking down the requirements