#EC2 Instances Used

EC2-1: Maven (Build Agent)
EC2-2: Tomcat
EC2-3: SonarQube
EC2-4: Nexus

#ports used

Maven : it does not listen on any Network ports
Tomcat : 8080
SonarQube : 9000
Nexus : 8081

Maven → SonarQube: for code analysis
Maven → Nexus: for artifact deployment

SonarQube IP: <SONAR_EC2_IP>
Nexus admin password: <NEXUS_ADMIN_PASSWORD>





