pipeline{
    agent any
    parameters {
        choice(name: 'branch', choices: ['2.10', '2.11'], description: 'Choose the branch to build')
    }
    stages{
        stage ('Cloning Git'){
            steps{
            checkout scmGit(branches: [[name: "*/${params.branch}"]], extensions: [], userRemoteConfigs: [[url: 'https://github.com/devsecops-documents/simple-java-maven-app.git']])
            }
        } 
        stage('Docker Build and Run'){
            steps{
            sh 'docker build --no-cache -t helloworld:${BUILD_NUMBER} .'
            sh 'docker run helloworld:${BUILD_NUMBER}'
            }
        }   
    }
}
