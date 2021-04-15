pipeline {
  agent any 
  stages {
    stage('Build') {
      steps {
        sh "mvn compile"
        sh "http://192.168.0.26:9966/petclinic/swagger-ui.html#/"
      }
    }  
    stage('Test') {
      steps {
        sh "mvn test"
      }
     post {
      always {
        junit '**/TEST*.xml'
      }
     }
  }
 }
}
