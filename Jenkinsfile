pipeline{
    agent {
        label 'NODEJS'
    }
    stages {
        stage('Compile Code') {
            steps {
                sh '''
                mvn compile
            '''
            }
        }
        stage('Make Package') {
            steps {
                sh '''
                mvn package
            '''
            }
        }
        stage('prepare Artifacts') {
            steps {
                sh '''
                zip -r users.zip *
            '''
            }
        }
        stage('upload Artifacts') {
            steps {
                sh '''
           curl -f -v -u admin:admin123 --upload-file users.zip http://172.31.9.43:8081/repository/users/users.zip
        '''
            }
        }
    }
}
