pipeline {
	stages{
		stage('Preparation') { 
			steps {
				checkout scm
			}
		}
		stage('Build') {
			steps {
				sh("sudo chmod +x *")
				sh("./mvnw package")
				agent {
					dockerfile {
						filename 'Dockerfile'
						dir '.'
						label 'stelo-docker-dev'
						additionalBuildArgs  '--build-arg JAR_FILE=target/gs-spring-boot-docker-0.1.0.jar'
					}
				}
				docker.withServer('tcp://dzangao01:888') {
					docker.image('stelo-docker-dev').withRun('-p 8080:8080') {
					}
				}
			}
		}
	}	
}