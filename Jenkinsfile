pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage("init") {
            steps {
                script {
                    sh 'echo "initialize project"'
                    sh 'source venv/bin/activate'
                    sh 'pip3.8 install -r requirements.txt'
                }
            }
        }
        stage('Build') {
            steps {
                sh 'pip3.8 install wheel'
                sh 'python3.8 setup.py bdist_wheel'
            }
        }
        stage('Test') {
            steps {
                sh 'pip3.8 install db-sqlite3'
                sh 'pip3.8 install pytest coverage'
                sh 'pytest'
                sh 'coverage run -m pytest'
                sh 'coverage report'
                sh 'coverage html'
            }
            post {
                always {
                    junit 'htmlcov/index.html'
                }
            }
        }
//         stage('Sanity check') {
//             steps {
//                 input "Does the staging environment look ok?"
//             }
//         }
//         stage('Deploy - Staging') {
//             steps {
//                 sh './deploy staging'
//                 sh './run-smoke-tests'
//             }
//         }
//         stage('Deploy - Production') {
//             steps {
//                 sh './deploy production'
//             }
//         }
    }

     post {
         always {
             mail bcc: '', body: "<b>Example</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "lutfunnaharlota@gmail.com";
         }
         success {
             echo 'This will run only if successful'
         }
//          failure {
//              mail bcc: '', body: "<b>Example</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "foo@foomail.com";
//          }
//          unstable {
//              echo 'This will run only if the run was marked as unstable'
//          }
//          changed {
//              echo 'This will run only if the state of the Pipeline has changed'
//              echo 'For example, if the Pipeline was previously failing but is now successful'
//          }
     }

}