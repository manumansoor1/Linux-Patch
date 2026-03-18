pipeline {
    agent any

    stages {
        stage('Run Patch on Remote Server') {
            steps {
                echo "Starting remote patching..."

                sh '''
                set -e

                echo "Making script executable"
                chmod +x nginx.sh

                echo "Copying script to remote server"
                scp -i /var/lib/jenkins/.ssh/id_rsa -o StrictHostKeyChecking=no nginx.sh ec2-user@18.61.156.128:/tmp/

                echo "Executing patch script on remote server"
                ssh -i /var/lib/jenkins/.ssh/id_rsa -o StrictHostKeyChecking=no ec2-user@18.61.156.128 "
                    chmod +x /tmp/nginx.sh && sudo /tmp/nginx.sh
                "

                echo "Patching completed"
                '''
            }
        }
    }
}
