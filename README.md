# README

# Design log 

## Schema 
![schema](app/assets/images/schema.png)
## Website flowchart 
![website flowchart](/study-on-demand/app/assets/images/flow%20chat.png)

## Features 
1. 2 portals for students and lecturers 
2. API for avatar picture auto-creation 

# Development 

* Ruby version
  This project is built on *ruby 2.7.7p221 (2022-11-24 revision 168ec2b1e5) [arm64-darwin22]*. 

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
## Data Association 
1. 1:M Students and Enrolments
- `student.rb` 
    ```ruby 
    class Student < ApplicationRecord
        has_many :enrolments
    end
    ```
- `erolment.rb`
  ```ruby
    class Enrolment < ApplicationRecord
        belongs_to :students, :optional => true 
    end

  ```
2. 1:M Enrolments and Courses 
- `enrolment.rb`
    ```ruby
        class Enrolment < ApplicationRecord
            belongs_to :students, :optional => true 
            belongs_to :course, :optional => true 
        end
    ```
- `course.rb`
  ```ruby
    class Course < ApplicationRecord
        has_many :enrolments
    end
  ```
3. M:M Lecturers and Courses 
- `course.rb`
  ```ruby
    class Course < ApplicationRecord
        has_many :enrolments
        has_and_belongs_to_many :lecturers
    end
  ```
- `lecturer.rb`
  ```ruby
    class Lecturer < ApplicationRecord
        has_and_belongs_to_many :courses
    end
  ```