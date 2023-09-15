pipeline{
    agent any
    tools{
        maven 'Maven'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sylvestra81/ideal-project.git']])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh'docker build -t sylvestra/devops-integration .'
                }
            }
        }
        stage('login to docker Hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'sylvestra', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u sylvestra -p ${dockerhubpwd}'
}
                }
            }
        }
        stage('push image to docker Hub'){
            steps{
                script{
                    sh 'docker push sylvestra/devops-integration'
                }
            }
        }
    }
}