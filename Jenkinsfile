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
	        	pwd()
	        	docker.build("gs-spring-boot-docker:0.1.0", '--build-arg "JAR_NAME=target/gs-spring-boot-docker:0.1.0.jar"')
		    }
        	agent { 
			    dockerfile true 
			}
        }
    }
}