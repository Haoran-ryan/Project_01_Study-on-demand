# README

# Design log 

## Schema 
![schema](app/assets/images/schema.png)
## Website flowchart 
![website flowchart](/study-on-demand/app/assets/images/flow%20chat.png)

## Features 
1. 2 portals for students and lecturers 
2. API for avatar picture auto-creation 


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  This project is built on *ruby 2.7.7p221 (2022-11-24 revision 168ec2b1e5) [arm64-darwin22]*. 

* System dependencies

* Configuration

* Database creation
    ```shell
    rails db:create 

    # 1:M relationship between Students and Enrolments 
    rails g model Student name:text email:text image:text
    rails db:migrate

    rails g model Enrolment completion:boolean student_id:integer
    rails db:migrate 

    # 1:M relationship between Enrolments and Courses
    rails g model Courses name:text intro:text image:text enrolment_id:integer
    rails db:migrate 

    # Lecturer table 
    rails g model Lecturer name:text email:text image:text admin:boolean
    rails db:migrate 

    # M:M relationship : ioin Lecturers and Courses
    rails g migration create_courses_lecturers course_id:integer lecturer_id:integer
    ## remove the automatically created id for the join table before migration
    rails db:migrate

    ```
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
