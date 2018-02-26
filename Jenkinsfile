pipeline {
    agent { 
    	dockerfile true 
    }
    stages {
    	stage('Checkout') {
			steps {
				checkout scm
			}
		}
        stage('Build') {
            steps {
                sh 'sudo chmod +x *'
				sh './mvnw package'
            }
        }
    }
}