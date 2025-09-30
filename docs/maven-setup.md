# Tomcat Setup and Manual Deployment

## Installation Prerequisites
- Java JDK 8 or higher installed on the EC2 instance. (t2.micro is enough)
- Minimum 1 GB RAM allocated for Tomcat.
- Ensure the instance has network access from the Maven/Build EC2 instance.

## Installation Steps
1. Download Apache Tomcat from the official website.
2. Extract the package on the EC2 instance in `/opt`:
```
tar -xvzf apache-tomcat-<version>.tar.gz -C /opt/
```
3. Set environment variables in `.bashrc` or `.bash_profile`:

```
export M2_HOME=/opt/apache-maven-<version>
export PATH=$M2_HOME/bin:$PATH
```

4. Navigate to the `bin/` directory and start Tomcat:
```
./startup.sh
```

5. Verify Tomcat is running by accessing:
```
http://<TOMCAT_EC2_IP>:8080
```



## Project Build
- Navigate to the Maven project directory.
- Clean and package the project:

  ```
  mvn clean package
  ```

- WAR file will be generated in the `target/` directory.
- WAR file will be generated in the `target/` directory.

## Integration with SonarQube

- Configure `settings.xml` with SonarQube token or pass via CLI.
- Run SonarQube analysis:

  ```
   mvn sonar:sonar
  -Dsonar.host.url=http://<SONAR_EC2_IP>:9000
  -Dsonar.login=<SONAR_TOKEN>  
  ```

  
## Integration with Nexus
- Configure `settings.xml` with Nexus credentials and repository URLs.
- Deploy artifacts manually:
```
mvn deploy
-DaltDeploymentRepository=nexus::default::http://<NEXUS_EC2_IP>:8081/repository/releases/
```

## Notes
- This setup uses **manual orchestration** only; no Jenkins or pipeline automation.
- Ensure versioning of artifacts to prevent overwriting in Nexus.
- Sensitive data such as `<SONAR_TOKEN>` and `<NEXUS_ADMIN_PASSWORD>` are placeholders.
