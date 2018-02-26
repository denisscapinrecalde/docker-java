node {
	checkout scm
    sh 'sudo chmod +x *'
	sh './mvnw package'
    docker.build("gs-spring-boot-docker:0.1.0")
}
