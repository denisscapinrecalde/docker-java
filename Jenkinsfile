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
        	agent { 
			    	dockerfile true 
			}
        	steps {
	        	sh 'echo teste'
		    }
        }
    }
}