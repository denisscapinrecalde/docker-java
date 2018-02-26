node {
   stage('Preparation') { 
   	  checkout scm
   }
   stage('Build') {
   	  sh("sudo chmod +x *")
   	  sh("./mvnw package")
   	  agent {
		    // Equivalent to "docker build -f Dockerfile.build --build-arg version=1.0.2 ./build/
		    dockerfile {
		        filename 'Dockerfile'
		        dir '.'
		        label 'stelo-docker-dev'
		        additionalBuildArgs  '--build-arg JAR_FILE=target/gs-spring-boot-docker-0.1.0.jar'
		    }
		}

   }
}