node {
	stage("Checkout") {
		checkout scm
	}
	stage("Build") {
    	sh 'sudo chmod +x *'
		sh './mvnw package'
	}
	stage("Docker")  {
    	docker.withServer("tcp:dzangao01:888").build("gs-spring-boot-docker:0.1.0")
    }
}
