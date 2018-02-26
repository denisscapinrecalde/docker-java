node {
   
   stage('Preparation') { 
   	  checkout scm
   }
   stage('Build') {
   	dir('docker-java'){
   	  sh("sudo chmod +x *")
   	  sh("./mvnw package")
      sh("sudo docker build --build-arg http_proxy=http://10.140.84.134:3130/ --build-arg https_proxy=https://10.140.84.134:3130/ --build-arg JAR_FILE=target/gs-spring-boot-docker-0.1.0.jar -t stelo-docker-dev -f Dockerfile .")
   	}
   }
   stage('Deploy') {
      sh("sudo docker run -p 8081:8080 -t stelo-docker-dev &")
   }
}