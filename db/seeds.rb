Student.destroy_all
s1 = Student.create :name => "Mark Zuckerberg", :email => "mark.zuckerberg@facebook.com", :image => "https://upload.wikimedia.org/wikipedia/commons/1/18/Mark_Zuckerberg_F8_2019_Keynote_%2832830578717%29_%28cropped%29.jpg", :password => "chicken", :password_confirmation => "chicken"
s2 = Student.create :name => "Bruce Lee", :email => "bruce.lee@gmail.com", :image => "https://upload.wikimedia.org/wikipedia/commons/c/ca/Bruce_Lee_1973.jpg", :password => "chicken", :password_confirmation => "chicken"

puts "#{Student.count} students"

Enrolment.destroy_all
e1 = Enrolment.create :completion => false 
e2 = Enrolment.create :completion => false 
e3 = Enrolment.create :completion => false 
e4 = Enrolment.create :completion => false 

puts "#{Enrolment.count} enrolments"

Course.destroy_all
c1 = Course.create :name => "Python", :intro => "Python is a high-level, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation. ", :image => "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/1280px-Python-logo-notext.svg.png"
c2 = Course.create :name => "Ruby", :intro => "Ruby is a dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.", :image => "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1920px-Ruby_logo.svg.png"
c3 = Course.create :name => "C", :intro => "C is a general-purpose computer programming language.", :image => "https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/The_C_Programming_Language_logo.svg/1920px-The_C_Programming_Language_logo.svg.png"
c4 = Course.create :name => "C++", :intro => "C++ is a high-level general-purpose programming language created by Danish computer scientist Bjarne Stroustrup as an extension of the C programming language, or \"C with Classes\". ", :image => "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/ISO_C%2B%2B_Logo.svg/1280px-ISO_C%2B%2B_Logo.svg.png"

puts "#{Course.count} courses"

Lecturer.destroy_all
l1 = Lecturer.create :name => "Dr Eric Martin", :email => "eric.martin@unsw.edu.au", :image => "https://api.research.unsw.edu.au/sites/default/files/images/profile/Eric_Martin.png", :admin => true, :password => "chicken", :password_confirmation => "chicken"
l2 = Lecturer.create :name => "Professor Michael Thielscher", :email => "m.thielscher@unsw.edu.au", :image => "https://api.research.unsw.edu.au/sites/default/files/images/profile/photo_3.jpg", :admin => false, :password => "chicken", :password_confirmation => "chicken"
l3 = Lecturer.create :name => "Zhengyi Yang", :email => "zhengyi.yang@unsw.edu.au", :image => "https://api.research.unsw.edu.au/sites/default/files/images/profile/bcam0041.jpg", :admin => false, :password => "chicken", :password_confirmation => "chicken"
puts "#{Lecturer.count} lecturers"

# Associate the data
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

puts "Courses and Lecturers"
c1.lecturers << l1 << l2
c2.lecturers << l1 << l2
c3.lecturers << l1 << l2
c4.lecturers << l1 << l2
puts "Done 3"

puts "Lecturers and Enrolments"
l1.enrolments << e1 << e3
l2.enrolments << e2 << e4
l3.enrolments << e1 << e4 
puts "Done 4"