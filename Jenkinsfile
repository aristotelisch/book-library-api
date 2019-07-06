pipeline {

  agent { docker { image 'ruby:2.5.3' } }

  stages {

    stage('requirements') {

      steps {

        sh 'gem install bundler -v 2.0.1'
      }
    }

    stage('build') {

      steps {

        sh 'bundle install'
        sh 'bundle exec rake db:create RAILS_ENV=test'
        sh 'bundle exec rake db:migrate RAILS_ENV=test'
      }
    }

    stage('test') {

      steps {

        sh 'bundle exec rspec'
      }
      post {
        always {
          sh 'echo cleanup task'
        }
      }
    }
  }
}
