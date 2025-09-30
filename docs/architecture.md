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

## High-Level Workflow
1. **Build**: Maven compiles Java code and packages it into a WAR file.  
2. **Code Quality Analysis**: Maven triggers SonarQube to analyze the project. Results are visible on the SonarQube web interface.  
3. **Artifact Management**: Maven publishes the built artifact to Nexus (snapshots or releases repository).  
4. **Deployment**: WAR file is manually copied to the Tomcat server for execution.


ASCII Architecture Diagram
```
   Developer Workstation
            |
            v
   [Maven/Build Agent EC2]
        |        \
        |         \
        v          v
[SonarQube EC2]   [Nexus EC2]
        |              |
        |              v
        |        [Artifacts stored]
        v
[Tomcat EC2 - WAR Deployment]
```


## Notes
- No automation server (e.g., Jenkins) is used.  
- All deployments, builds, and configurations are manual.  
- Sensitive values such as IPs, passwords, and tokens are stored as placeholders.  




