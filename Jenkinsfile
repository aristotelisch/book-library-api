pipeline {

  agent { docker { image 'ruby:2.5.3' } }

  environment {
    BOOK_LIBRARY_API_USR = credentials('book-library-api-psql')
    BOOK_LIBRARY_API_PSW = credentials('book-library-api-psql')
    BOOK_LIBRARY_API_PSQL_URL = credentials('book-library-api-psql-url')
  }

  stages {

    stage('requirements') {

      steps {
        sh 'gem install bundler -v 2.0.1'
      }
    }

    stage('build') {

      steps {

        sh 'bundle install'
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
