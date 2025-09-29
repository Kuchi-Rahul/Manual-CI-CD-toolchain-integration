# Manual-CI-CD-toolchain-integration


This repository demonstrates a **manual setup of a CI/CD toolchain** using multiple EC2 instances without Jenkins.

## Overview

### EC2 Instances
- **EC2-1:** SonarQube (`<SONAR_EC2_IP>`, port 9000)
- **EC2-2:** Nexus Repository Manager (`<NEXUS_EC2_IP>`, port 8081)
- **EC2-3:** Tomcat (`<TOMCAT_EC2_IP>`, ports 8080/8443)
- **EC2-4:** Maven/Build agent (runs builds and deployments)

### Toolchain Flow
1. Maven builds project locally or on build agent.
2. SonarQube analyzes code quality (`sonar:sonar`).
3. Maven deploys artifacts to Nexus.
4. WAR files are deployed to Tomcat.

---

## Repository Structure


