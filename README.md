## Node.org DevOps Pipeline

This project showcases a Node.js application integrated with a Jenkins pipeline. The pipeline automates the processes of building, testing, and deploying the application, ensuring efficient and reliable software delivery. Deployment is handled using Docker Compose

### Features

- Automated Builds: The pipeline automatically installs dependencies and builds the application upon code commits.
- Automated Testing: Executes unit and integration tests to validate code changes.
- Containerized Deployment: Uses Docker Compose to deploy the application.
- Continuous Deployment: Automatically deploys the latest version of the application.

### Prerequisites

- **Node.js**
- **Jenkins**
- **Docker**

### Pipeline Summary

![Pipeline(2)](https://github.com/user-attachments/assets/01d1b387-114c-4e9a-accb-23b3555f1bf5)

#### Stages
1. Cloning the repo
2. using `eslint` to lint the code for errors and style
3. unit testing the code
4. using `trivy` to scan code for vulnerabilities
5. Building Docker image and push it into docker hub
6. using `trivy` to scan the created image
7. starting the docker compose

#### Compose

the compose file consists of 5 containers
1. two container the runs the web app
2. nginx container to work as a load balancer
3. cAdvisor to generate the matrices for containers
4. prometheus container to store and get data from cAdvisor

### Screenshots

- the web app working on port 80 (which nginx are configured to work on)
![node1](https://github.com/user-attachments/assets/63e9e962-d386-4dfe-8024-6edfa886ff36)

- matrices genereate by cAdvisor Stored using prometheus and visualized using grafana
![node2](https://github.com/user-attachments/assets/e0597e30-f938-4998-9cdb-dccd011ccea9)

- Docker Compose containers
![node3](https://github.com/user-attachments/assets/cff06fbf-aee2-4f4c-b490-99fede194500)


### Contributing

Contributions are welcome! Please fork this repository and submit a pull request for any enhancements or bug fixes.

### License

This project is licensed under the MIT License. 
