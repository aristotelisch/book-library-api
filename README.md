# Book Library API

A simple api to manage publishers books and authors.

## ERD Diagram  
![Database ERD](/db/ERD.png?raw=true "Database ERD")  

## Configuration
* Ruby version  `2.5.3`  

* Install necessary gems
    ```bash
    bundle install
    ```

* Database configuration  
    You need to have installed and running the postgresql database  

    In order to connect to your local database  
    enter your username and password in `config/database.yml`

* Database setup
    * Create the databases
    ```bash
    bin/rails db:create  
    ```
    
    * Run migrations
    ```bash
    bin/rails db:migrate  
    ```

* Database initialization
    * Load development (fake) data from db/seeds.rb
    
    ```bash
    bin/rails db:seed
    ```

