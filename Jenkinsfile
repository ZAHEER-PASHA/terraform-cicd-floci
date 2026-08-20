pipeline {
    agent any

    stages {

        stage('Terraform Init') {
            steps {
                bat 'terraform init'
            }
        }

        stage('Terraform Format Check') {
            steps {
                bat 'terraform fmt -check'
            }
        }

        stage('Terraform Validate') {
            steps {
                bat 'terraform validate'
            }
        }
        stage('Test Failure') {
            steps {
                bat 'this-command-does-not-exist'
            }
        }

        stage('Terraform Plan') {
            steps {
                bat 'terraform plan -out=tfplan'
            }
        }
        stage('Archive Terraform Plan') {
            steps {
                archiveArtifacts artifacts: 'tfplan', fingerprint: true
            }
        }

        stage('Approval') {
            steps {
                input message: 'Do you want to apply Terraform changes?', ok: 'Apply'
            }
        }

        stage('Terraform Apply') {
            steps {
                bat 'terraform apply tfplan'
            }
        }
    }
}