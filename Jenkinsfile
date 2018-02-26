node {
   
   stage('Preparation') { 
   	  sh("git clone -o origin git://github.com/denisscapinrecalde/docker-java.git")
   }
   stage('Build') {
   	dir('docker-java'){
   	  sh("sudo mvnw package")
      sh("sudo docker build --build-arg http_proxy=http://10.140.84.134:3130/ --build-arg https_proxy=https://10.140.84.134:3130/ --build-arg JAR_FILE=target/stelo-docker-java-0.1.0.jar -t stelo-docker-dev -f Dockerfile .")
   	}
   }
   stage('Deploy') {
      sh("sudo docker run -p 8081:8080 -t stelo-docker-dev &")
   }
}