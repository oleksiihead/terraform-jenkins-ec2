pipeline {
    agent any

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
        booleanParam(name: 'destroy', defaultValue: false, description: 'Destroy Terraform build?')
    }

    environment {
        AWS_ACCESS_KEY_ID = credential('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credential('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage {
            steps {}
        }

        stage('Terraform plan')
    }
}
