pipeline {
    agent any
    stages {

        stage('Build Rest-API') {
                    steps {
                        sh 'cd spring-petclinic-rest-master/spring-petclinic-rest-master && nohup mvn spring-boot:run &'
                    }
                }


        stage('Build Angular-Front End') {
            steps {
                sh 'cd spring-petclinic-angular/static-content && curl https://jcenter.bintray.com/com/athaydes/rawhttp/rawhttp-cli/1.0/rawhttp-cli-1.0-all.jar -o rawhttp.jar && nohup java -jar ./rawhttp.jar serve . -p 4200 &'
                sh 'sleep 11'

            }
        }



        stage('Robot') {
           steps {
             catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                 sh 'robot --variable BROWSER:headlesschrome -d spring-petclinic-angular/Robot_CriticalFlow_Test/Results spring-petclinic-angular/Robot_CriticalFlow_Test/Tests'
               }
           }

           post {
                always {
                    script {
                        step(
                            [
                               $class                  :   'RobotPublisher',
                                outputPath              :   'spring-petclinic-angular/Robot_CriticalFlow_Test/Results',
                                outputFileName          :   '**/output.xml',
                                reportFileName          :   '**/report.html',
                                logFileName             :   '**/log.html',
                                disableArchiveOutput    :   false,
                                passThreshold           :   50,
                                unstableThreshold       :   40,
                                otherFiles              :   "**/*.png,**/*.jpg",
                            ]
                        )
                    }
                }
            }

       }



   }

}
