# README

# Design 

## Schema 
![schema](app/assets/images/schema.png)
## Website flowchart 
![website flowchart](/study-on-demand/app/assets/images/flow%20chat.png)

## Features 
1. 2 portals for students and lecturers 
2. API for avatar picture auto-creation
3. API for teams / zoom meetings  

# Development Log 
## 20-01-2023
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
* Data Association 
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
* Seed Sample Data 
    ```shell
    rails db:seed 
    ```



### Prolems and Fixes 
1. Issue 1 : incorrect FK in Courses table 
   ```shell
    rails generate migration add_course_id_to_enrolments course_id:integer
    rails db:migrate 
   ```
2. Issue 2: incorrect associations 
   ```ruby
    puts "Students and Enrolments"
    s1.enrolments << e1 << e2
    s2.enrolments << e3 << e4
    puts "Done 1"

    puts "Enrolments and Courses"
    c1.enrolments << e1
    c2.enrolments << e2
    c3.enrolments << e3
    c4.enrolments << e4
    puts "Done 2"
   ```

## 21-01-2023
* Home Page creation
  ```shell 
    rails g controller Pages index --skip-routes
  ```
  `index.html.erb` and `pages_controller.rb` updates 

* `Students` controller and views createion 
  ```shell
    rails g controller Students index show new edit --skip-routes 
  ```
## 22-01-2023
`students` 
- `index` 
  - `index` action defined in `studnet_controller.rb` 
  - `index.html.erb`
- `show` 
  - link_to set up for each student on index page 
  - `show.html.erb`
  - `show` action defined in the controller 
-`new`
  - define the `new` action in the controller 
  - create a partial `_form.html.erb` 

`application.html.erb` 
- `nav` bar added: `new studnet` & `all students`


### Problems and Fixes 
- How to display the courses a student enrols in? The courses table is indirectly connected to the students via the enrolments table. 
  ```ruby
  # convert the db from sqlite to postgresql
  ```