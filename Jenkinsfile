pipeline{
    agent any
    tools {
        maven 'M2_HOME'
    }
    environment {
        registry = '880385147960.dkr.ecr.us-east-1.amazonaws.com/hospital_management_ecr_repo'
        dockerImage = ''
    }
     stages{
         stage('Git Checkout') {
             steps{
             git branch: 'main', url: 'https://github.com/henrykrop2022/hospital_management.git'
             }
         }
        stage('Unit Test'){
             steps{
                 sh 'mvn test'
             }
         }
        stage('Maven Build'){
             steps{
                 sh 'mvn clean package'
             }
         }
        stage('Sonar Analysis'){
             steps{
                script{
                     withSonarQubeEnv(credentialsId: 'hospital-token') {
                sh 'mvn sonar:sonar'
                     }
                 }
             }
         }
        stage('Building Image'){
             steps{
                 script{
                     docker = docker.build registry
                }
             }
         }
        stage('Pushing to ECR'){
             stages{
                script {
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 880385147960.dkr.ecr.us-east-1.amazonaws.com'
                sh 'docker push 880385147960.dkr.ecr.us-east-1.amazonaws.com/hospital_management_ecr_repo:latest'     
                }
            }
         }

     }
}