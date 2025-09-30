
# SonarQube Setup and Usage

## Installation Prerequisites
- Java JDK 11 or higher installed.
- Minimum 2 GB RAM allocated for SonarQube server.
- Ensure `JAVA_HOME` is correctly set.
- Always run in a dedicated Sonar user 

## Installation Steps
1. Download SonarQube from the official site.
2. Download and Extract the package on the EC2 instance in /opt directory.
3. Navigate to the `bin/<OS>` directory.
4. Start SonarQube using:
   ```
     ./sonar.sh start
   ```
5. Verify SonarQube is running at:
   ```
   http://<SONAR_EC2_IP>:9000
   ```


## Project Setup

- Create a new project in SonarQube web UI.
- Generate a token `<SONAR_TOKEN>` for authentication.
- Configure Maven to use the token in `settings.xml` or via command line.

## Maven Integration
Run SonarQube analysis after build using:

```
mvn clean verify sonar:sonar
-Dsonar.host.url=http://<SONAR_EC2_IP>:9000
-Dsonar.login=<SONAR_TOKEN>
```

## Notes
- Analysis reports include code quality, maintainability, and security metrics.
- All sensitive credentials are placeholders.
- This process is fully manual; no automation pipeline is used.
