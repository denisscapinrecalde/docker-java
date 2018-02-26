node {
   stage('Preparation') { 
   	  checkout scm
   }
   stage('Build') {
   	  docker.withRun('--build-arg JAR_FILE=target/gs-spring-boot-docker-0.1.0.jar -t stelo-docker-dev -f Dockerfile .')
   	  sh("./mvnw package")
   	  docker.build('--build-arg JAR_FILE=target/gs-spring-boot-docker-0.1.0.jar -t stelo-docker-dev').withRun('-p 8081:8080')
   }
}