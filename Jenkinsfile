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
    }
}
node {
	docker.build("gs-spring-boot-docker:0.1.0")
}