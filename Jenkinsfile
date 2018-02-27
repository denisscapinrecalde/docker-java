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
    		def version = 2
	        def customImage = docker.build("gs-spring-boot-docker:"version, "--build-arg JAR_NAME=target/gs-spring-boot-docker-version.jar .")
	        customImage.push()
	        customImage.push('latest')
    	}
    }
    stage("Deploy Swarm Dev")  {
    	echo 'Dev'
    	docker.withServer('tcp://swarm.example.com:2376', 'swarm-certs') {
        docker.image('mysql:${version}').withRun('-p 3306:3306') {
            /* do things */
	        }
	    }
    }
    stage("Deploy Swarm Hml")  {
    	slackSend color: 'good', message: 'You have a new deploy to approve on Jenkins (Hml)'
    	input 'Deploy to Docker Swarm Hml?', submitter: 'hml-group'
    	docker.withServer('tcp://swarm.example.com:2376', 'swarm-certs') {
        docker.image('mysql:${version}').withRun('-p 3306:3306') {
            /* do things */
	        }
	    }
    }
    stage("Deploy Swarm Prd")  {
    	slackSend color: 'good', message: 'You have a new deploy to approve on Jenkins (Prd)'
    	input 'Deploy to Docker Swarm Prd?', submitter: 'prd-group'
    	docker.withServer('tcp://swarm.example.com:2376', 'swarm-certs') {
        docker.image('mysql:${version}').withRun('-p 3306:3306') {
            /* do things */
	        }
	    }
    }
    stage("Rollback")  {
    	input 'Do you want to rollback app?', submitter: 'prd-group'
    	docker.withServer('tcp://swarm.example.com:2376', 'swarm-certs') {
        docker.image('mysql:${version-1}').withRun('-p 3306:3306') {
            /* do things */
	        }
	    }
    }
}