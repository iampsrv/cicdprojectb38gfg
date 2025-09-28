pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "gfgbatch38flaskapp"
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
                // script {
                //     // Build the Docker image
                //     //docker.build("${IMAGE_TAG}")
                    
                // }
                sh 'docker build -t ${IMAGE_TAG} .'
                echo 'Build docker image done successfully'
            }
        }
        stage('Login to docker hub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                sh 'docker login -u psrv3 -p ${dockerhubpwd}'}
                echo 'Login successfully'
            }
        }        
        stage('Publish docker image') {
            steps {
                sh 'docker push ${IMAGE_TAG}'
                echo 'Publish docker image done successfully'
            }
        }
    }
}
