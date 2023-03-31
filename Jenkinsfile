pipeline{
    agent any
    tools {
        maven 'M2_HOME'
    }
    stages{
        stage('Git Checkout') {
            git branch: 'main', url: 'https://github.com/henrykrop2022/hospital_management.git'
        }
    }
}