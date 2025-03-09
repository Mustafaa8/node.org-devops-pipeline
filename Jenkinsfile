pipeline {
    agent any
    tools {
        nodejs 'nodejs18'
    }
    environment {
        IMAGE_NAME = 'mostafaa8/nodeorg'
        IMAGE_TAG = 'latest'
    }
    stages {
        stage('Cloning') {
            steps {
                git branch: 'devops' , url: 'https://github.com/Mustafaa8/nodejs.org-devops-pipeline.git' , credentialsId: 'gittoken'
            }
        }
        stage('Linting the Code') {
            steps {
                sh '''
                npm ci
                npm run format
                '''
            }
        }
        stage('Unit Testing') {
            steps {
                sh '''
                npm test
                '''
            }
        }
        stage('Codebase Scanning'){
            steps {
                sh 'docker run --rm -v ./:/output -w /output aquasec/trivy fs .'
            }
        }
        stage('Dockerizing') {
            steps {
            sh '''
            docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
            '''
            withCredentials([usernamePassword(credentialsId: 'docker-cred' , usernameVariable: 'DOCKER_USER' , passwordVariable: 'DOCKER_PASS' )]) {
                sh 'echo "${DOCKER_PASS}" | docker login -u ${DOCKER_USER} --password-stdin'
                sh 'docker push ${IMAGE_NAME}:${IMAGE_TAG}'
                sh 'docker logout'
            }
        }}
        stage('Docker Image Scanning') {
            steps {
                sh '''
                docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v ./:/output -w /output aquasec/trivy image ${IMAGE_NAME}:${IMAGE_TAG}
                '''
            }
        }
        stage('Docker Composing') {
            steps {
                sh 'docker compose -f ./compose/compose.yml up'
            }
        }
    }
}