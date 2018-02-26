pipeline {
	agent any
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
        stage('Docker'){
        	steps {
	        	sh 'echo teste'
	        	dir('../docker-test')
		    }
        	agent { 
			    	dockerfile true 
			}
        }
    }
}