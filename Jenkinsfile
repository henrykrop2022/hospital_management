pipeline{
    agent any
    tools {
        maven 'M2_HOME'
    }
    enviroment{
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

     }
}