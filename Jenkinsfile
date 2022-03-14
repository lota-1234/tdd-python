pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
            steps {
                sh 'echo "hello"'
                sh 'source venv/bin/activate'
                sh 'pip3.8 install wheel'
                sh 'python3.8 setup.py bdist_wheel'
//                 stash(name: 'compiled-results', includes: 'sources/*.py*')
            }
        }
        stage('Test') {
            steps {
                sh 'py.test --verbose --junit-xml test-reports/results.xml sources/test_calc.py'
            }
            post {
                always {
                    junit 'test-reports/results.xml'
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