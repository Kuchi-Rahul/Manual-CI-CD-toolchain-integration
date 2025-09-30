# Tomcat Setup and Manual Deployment

## Installation Prerequisites
- Java JDK 8 or higher installed on the EC2 instance in `opt`.
- Always do apt update and upgrade before java installation.
- Minimum 1 GB RAM allocated for Tomcat.
- Ensure the instance has network access from the Maven/Build EC2 instance.


## Installation Steps
1. Download Apache Tomcat from the official website.
2. Extract the package on the EC2 instance:
```
tar -xvzf apache-tomcat-<version>.tar.gz  /opt/
                 or
unzip apache-tomcat-9.0.109.zip -d /opt/  
```

3. Navigate to the `bin/` directory and start Tomcat:
```
./startup.sh
```

4. Verify Tomcat is running by accessing:
```
http://<TOMCAT_EC2_IP>:8080
```


## Configuration
- Edit `conf/tomcat-users.xml` to define an admin user for deployment:
``` 
<user username="<TOMCAT_ADMIN_USER>" password="<TOMCAT_ADMIN_PASSWORD>" roles="manager-gui"/
```
#we can add more users if we need.



## Manual Deployment of WAR Files:

1.Build the WAR file using Maven on the build agent.
2.Transfer the WAR file to Tomcat’s webapps/ directory using SCP from local:
```
scp target/<project>.war <TOMCAT_ADMIN_USER>@<TOMCAT_EC2_IP>:/opt/tomcat/webapps/
```
3.Restart Tomcat to deploy the application:
```
./shutdown.sh
./startup.sh
```
4.Access the deployed application at:
```
http://<TOMCAT_EC2_IP>:8080/<project>
```

## Notes

1.All steps are manual; no CI/CD automation is configured.

2.Sensitive credentials like <TOMCAT_ADMIN_USER> and <TOMCAT_ADMIN_PASSWORD> should be replaced securely.

3.This setup is ideal for learning the workflow before automating with Jenkins or other tools.
