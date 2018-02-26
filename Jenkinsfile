node {
	stage("Checkout") {
		checkout scm
	}
	stage("Build") {
    	sh 'sudo chmod +x *'
		sh './mvnw package'
	}
	stage("Docker")  {
    	docker.build("gs-spring-boot-docker:0.1.0", "--build-arg JAR_NAME=target/gs-spring-boot-docker-0.1.0.jar .")
    }
}