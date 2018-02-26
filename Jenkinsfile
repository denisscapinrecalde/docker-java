pipeline {
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
	        	agent { 
			    	dockerfile true 
			    }
		    }
        }
    }
}