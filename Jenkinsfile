pipeline {
    agent any
    tools {
        jdk 'jdk17'
        nodejs 'node16'
    }
    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }
    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Checkout from Git') {
            steps {
                git branch: 'main', url: 'https://github.com/Adeynike/3MTT-DevOps-Week-2-ASSGN.git'
            }
        }
        stage("SonarQube Analysis") {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh ''' $SCANNER_HOME/bin/sonar-scanner \
                    -Dsonar.projectName=DevOps-Capstone-Project \
                    -Dsonar.projectKey=DevOps-Capstone-Project '''
                }
            }
        }
        stage("Quality Gate") {
            steps {
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'Sonar-token'
                }
            }
        }
        stage('Install Dependencies') {
            steps {
                sh "npm install"
            }
        }
        stage("Docker Build & Push") {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker', toolName: 'docker') {
                        sh '''
                        docker build -t devops-capstone-project .
                        docker tag devops-capstone-project adeynike/devops-capstone-project:latest
                        docker push adeynike/devops-capstone-project:latest
                        '''
                    }
                }
            }
        }
        stage("Run Docker Container") {
            steps {
                script {
                    // Stop and remove any running container with the same name
                    sh '''
                    docker rm -f devops-capstone || true
                    docker pull adeynike/devops-capstone-project:latest
                    docker run -d -p 8081:8081 --name devops-capstone adeynike/devops-capstone-project:latest
                    '''
                }
            }
        }
    }
}

