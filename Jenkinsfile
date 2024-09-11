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

        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
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
