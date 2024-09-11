pipeline {
    agent any

    environment {
        NODEJS_HOME = tool 'NodeJS 14.0.0'
        PATH = "${NODEJS_HOME}/bin:${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Adeynike/3MTT-DevOps-Week-2-ASSGN.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                // Add deployment steps here, e.g., copying files to a server or running a deployment script.
            }
        }
    }

    post {
        always {
            deleteDir()
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
