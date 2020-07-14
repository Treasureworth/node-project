node {
    def app

    stage('Clone repository') {
        /* To make sure that the repository is cloned to workspace*/

        checkout scm
    }

    stage('Build stage') {
        /* This build the actual image similar to docker build on terminal*/

        app = docker.build("oniodunayo/node-project")
    }

    stage('Test image') {
        /* This is a sudo test */

        app.inside{
            sh 'echo "Test passed"'
        }
    }
    stage('Push image') {
        /* Finally pushing the image with two tags
        First: the incrememtal build
        Second, the 'latest' tag
        Pushing multiple tags is cheap, as all the layers are reused */

        docker.withRegistry('https://registry.hub.docker.hub', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}