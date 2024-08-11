# WordPress_example
Docker-version of worpress-based website with mysql-backend

**Prerequisites:**

* docker.io and git packages (for deb-based distro - apt install git docker.io)
* rights to manage docker (sudo usermod -a $USER -G docker; logoff-logon after changes) 

**How to install:**
1. open console terminal from $USER
2. git clone https://github.com/rodion-v/WordPress_example.git && cd WordPress_example
3. /bin/bash ./start.sh

**Additional information**
* Worked with AstraLinux with DISABLED astra-mac-control and astra-mic-control on docker.io 24.0.2
* Automatic scripts create dir WordPress_example/sqldb with sql-db into it, all user id/pass env you may find in Dockerfile and start.sh
* By default, website is available on 127.0.0.1:8080, but you can carefully tune security and modify this string 127.0.0.1:8080:80 to $ip:8080:80 to get access on $ip interface
