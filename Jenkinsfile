node {
	stage("Checkout") {
		checkout scm
	}
	stage("Build") {
    	sh 'sudo chmod +x *'
		sh './mvnw package'
	}
	stage("Docker")  {
    	docker.withRegistry('registry.prd1.stelo.local') {

	        def customImage = docker.build("gs-spring-boot-docker:0.1.0", "--build-arg JAR_NAME=target/gs-spring-boot-docker-0.1.0.jar .")

	        customImage.push()
    	}
    }
}
