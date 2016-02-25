class Classes

	def view_class
		@class = 'student1'
	end
	def add_class
		print 'Enter Class name: '
		class_name = gets.strip
		puts
		print 'Enter Class Year: '
		class_year = gets.strip
		puts

	end
	def edit_class
		#checks the class database, and looks at the table in array format, for editing.
		print 'Available classes for edit: Class 1 (a), class 2(b), class 3(c)'
		puts
		print 'Select option: '
		option= gets.strip
		puts
		print 'Enter class detail (1) , or Students details (2)'
		option2 = gets.strip


	end
	def remove_class
		print 'Available classes to remove: Class 1 (a), class 2(b), class 3(c)'
		puts
		print 'Select option: '
		option= gets.strip
		puts 'Are you sure?'
		puts 'Are you sure? x2'

	end
	private 
	def func1
	end
end

class Students << Classes

	def initialize
		#inherits from previous location. 
		@class = 1
	end
	def add_student
		fun2
		

	end
	def edit_student
		print "Select Student Id: "
		student_id = gets.strip
		puts
		puts ("Selecting #{student_id}")
		func2
		

	end
	def remove_student

	end
	private
	def func2
		print "Student First Name: "
		student_name = gets.strip
		puts
		print "Student Second Name: "
		student_name = gets.strip
		puts
		print "Student Current Grade: "
		student_name = gets.strip
		puts
		print "Student Predicted Grade: "
		student_name = gets.strip
		puts
	end
end



