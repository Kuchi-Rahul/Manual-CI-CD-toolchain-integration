# Nexus Repository Manager Setup and Usage

## Installation Prerequisites
- Java JDK 8 or higher installed.(I did 17)
- Minimum 2 GB RAM recommended.
- Ensure network access to Maven/Build and Tomcat EC2 instances.

## Installation Steps
1. Download Nexus Repository Manager OSS from the official website.
2. Extract the package on the EC2 instance in /opt dir.
3. Start Nexus using:
```
./bin/nexus start
```
4. Access Nexus web UI at:
```
http://<NEXUS_EC2_IP>:8081
```

## Repository Configuration
- Create two repositories:
- **Releases**: for production-ready artifacts.
- **Snapshots**: for ongoing development artifacts.
- Configure credentials:
- `<NEXUS_ADMIN_USER>`
- `<NEXUS_ADMIN_PASSWORD>`

## Maven Integration
- Update `settings.xml` in Maven to include Nexus credentials and repository URLs.
- Deploy artifacts manually using:
```
mvn deploy
-DaltDeploymentRepository=nexus::default::http://<NEXUS_EC2_IP>:8081/repository/releases/
```

## Notes
- All deployments are manual; no CI/CD automation is used.
- Artifacts must be versioned correctly to prevent overwrites.
- Sensitive credentials are represented as placeholders.

