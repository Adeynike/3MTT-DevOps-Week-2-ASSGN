pipeline {
    agent any

    environment {
        NODEJS_HOME = tool 'NodeJS 14.0.0'
        PATH = "${NODEJS_HOME}/bin:${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from the Git repository
                git url: 'https://github.com/Adeynike/3MTT-DevOps-Week-2-ASSGN.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install Node.js dependencies
                sh 'npm install'
            }
        }

        stage('Serve Application') {
            steps {
                // Start serving the application locally
                sh 'npx http-server -p 8080' // Serve on port 8080
            }
        }
    }

    post {
        always {
            // Clean up workspace
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
