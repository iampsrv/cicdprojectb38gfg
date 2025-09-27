pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "cicdprojectb38gfg"
        DOCKER_REGISTRY = "psrv3"  // Replace with your Docker Hub username
        IMAGE_TAG = "${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${env.BUILD_NUMBER}"
    }    

    stages {
        stage('Checkout') {
            steps {
                git "https://github.com/iampsrv/cicdprojectb38gfg.git"
                sh "ls -ltr"
                echo 'Checkout done successfully'
            }
        }
        stage('Setup') {
            steps {
                sh '''
                    python3 -m venv .venv
                    . .venv/bin/activate
                    pip install --upgrade pip
                    pip install flask pytest
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''
                    . .venv/bin/activate
                    pytest
                '''
                echo 'Test done successfully'
            }
        }
        stage('Build docker image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("${IMAGE_TAG}")
                }
                echo 'Build docker image done successfully'
            }
        }
        stage('Publish docker image') {
            steps {
                echo 'Publish docker image done successfully'
            }
        }
    }
}
