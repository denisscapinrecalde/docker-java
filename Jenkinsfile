node {
	stage("Checkout") {
		checkout scm
	}
	stage("Build App") {
    	sh 'sudo chmod +x *'
		sh './mvnw package'
	}
	stage("Image Registry")  {
    	docker.withRegistry('http://localhost:5000') {
	        def customImage = docker.build("gs-spring-boot-docker:1.0.0", "--build-arg JAR_NAME=target/gs-spring-boot-docker-0.1.0.jar .")
	        customImage.push()
	        customImage.push('latest')
    	}
    }
    stage("Deploy Swarm Dev")  {
    	echo 'Dev'
    	docker.withServer{
	        docker.image('localhost:5000/gs-spring-boot-docker:1.0.0').withRun('-p 8081:8080') {
	            echo 'Deploy'
	        }	
	    }
    }
}