pipeline {
  agent any
  stages {
    stage('Develepment Build') {
      when{
         branch 'develop'
      }
      steps {
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
          sh 'sh ./build.sh latest'
         }
      }
    }
    stage('Develepment Push') {
      when{
         branch 'develop'
      }
      steps {
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
          sh "sh ./push.sh latest $USERNAME $PASSWORD"
         }
      }
    }
    stage('Production Build') {
      when{
         branch 'master'
      }
      steps {
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
           sh "sh ./build.sh 16.0.0.Final"
         }
      }
    }
    stage('Production Push') {
      when{
         branch 'master'
      }
      steps {
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
           sh "sh ./push.sh 16.0.0.Final $USERNAME $PASSWORD"
         }
      }
    }
    stage('Cleanup') {
      steps {
        cleanWs(cleanWhenAborted: true, cleanWhenFailure: true, cleanWhenNotBuilt: true, cleanWhenSuccess: true, cleanWhenUnstable: true, cleanupMatrixParent: true, deleteDirs: true)
      }
    }
  }
}
