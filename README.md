# SONA deployer using docker-compose.

This is project is intended for auto-deploying SONA using docker-compose. The underlying idea of this project is to ease the deployment process of SONA in a light-weight manner. Ubuntu 18.04 is recommended, but it also works on CentOS 7 distribution.

## Requirements
- Operating System
  - Ubuntu 18.04
  - CentOS 7.7

## Installation

### Preparation
```$ sudo apt-get update -y```

```$ sudo apt-get upgrade -y```

### Install docker and docker-compose

```$ sudo apt-get install docker.io -y```

```$ sudo systemctl enable docker```

```$ sudo usermod -aG docker $(whoami)```

```$ sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose```

```$ sudo chmod +x /usr/local/bin/docker-compose```

### Deploy SONA
```
$ make start
docker-compose up -d
Creating network "edgestack-deploy_default" with the default driver
Creating edgestack-deploy_edgestack_1 ... done
```

### Terminate SONA
```
$ make stop
docker-compose down -t0
Stopping edgestack-deploy_edgestack_1 ... done
Removing edgestack-deploy_edgestack_1 ... done
Removing network edgestack-deploy_default
```

### Access SONA Shell
```
$ make cli
ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" -p 8101 karaf@localhost
Warning: Permanently added '[localhost]:8101' (RSA) to the list of known hosts.
Password authentication
Password:
Welcome to EdgeStack!
```

### Print out SONA log
```
$ make log
docker-compose logs -f edgestack
Attaching to edgestack-deploy_edgestack_1
edgestack_1  | Apr 09, 2020 6:37:37 AM org.apache.karaf.main.Main launch
edgestack_1  | INFO: Installing and starting initial bundles
edgestack_1  | Apr 09, 2020 6:37:37 AM org.apache.karaf.main.Main launch
edgestack_1  | INFO: All initial bundles installed and set to start
edgestack_1  | Apr 09, 2020 6:37:37 AM org.apache.karaf.main.lock.SimpleFileLock lock
edgestack_1  | INFO: Trying to lock /root/onos/apache-karaf-4.2.8/lock
edgestack_1  | Apr 09, 2020 6:37:37 AM org.apache.karaf.main.lock.SimpleFileLock lock
edgestack_1  | INFO: Lock acquired
edgestack_1  | Apr 09, 2020 6:37:37 AM org.apache.karaf.main.Main$KarafLockCallback lockAcquired
edgestack_1  | INFO: Lock acquired. Setting startlevel to 100
...
```
