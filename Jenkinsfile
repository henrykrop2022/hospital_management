pipeline{
    agent any
    tools {
        maven 'M2_HOME'
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
}