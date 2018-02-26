pipeline {
	stages{
		stage('Checkout') {
			steps {
				checkout scm
			}
		}
	}		
	stages{
		stage('Build') {
			steps {
				sh("sudo chmod +x *")
				sh("./mvnw package")
			}
			agent {
				dockerfile {
					filename 'Dockerfile'
					dir '.'
					label 'stelo-docker-dev'
					additionalBuildArgs  '--build-arg JAR_FILE=target/gs-spring-boot-docker-0.1.0.jar'
				}
			}
		}
	}	
}