pipeline {
    agent any

    stages {
        stage('Run Patch Script') {
            steps {
                echo "START PATCH"
                sh '''
                chmod +x patch.sh
                ./patch.sh
                '''
            }
        }
    }
}
