class Seating

	def initialize
		# 0 are available seats.
		puts 'Enter number of available seats'
		available_seats = gets.strip
	end

	def seat_layout
		seat_array =  [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]
	    row = 0
	    for x in  (0..10)
	        numToLetter(x)
	        print(l,seat_array[row],l)
	        row +=1
	    end
	end

	def algorithm
		#loud students to not be put next to another loud student, / put closer to the front.
		# needing students put on the front.
		# student cannot sit next to their problem partner
		# Everything else fills up the other rows.
		# Fill up so that the back should not be filled.
		student_list = student_list_data
		new_list = student_list.sort_by(level_learning)
		new_list = student_list.map{|student| student.level_learning == 1}
		student_list.sort_by(noise)
		student_list.each do |student|
			if student.noise == 3
				#do not put directly next to a studentnoise level of 2/3
				#and put minimum of 3 spaces away from another noise 3 student
			end
			#if seat layout has no more spaces, then allow to be put in the first available empty space. 
		end
	end
	def student_list_data
		puts 'Enter Class name'
		classname = gets.strip

		student_list = []
		id = 1
		loopy = true 
		while loopy == true
			puts 'Enter Student Name'
			name = gets.strip
			puts 'Enter noise level of student'
			noise = gets.strip
			puts 'Enter name of student/s to not sit next to'
			whitelist = gets.strip
			puts 'Enter priority of learning (if whether needs to be close to front)'
			level_learning = gets.strip
			puts 'Input another student? y/n'
			if gets.strip.upcase! == 'N'
				loopy = false
			else
				puts 'Continuing..'
			end
			student_list << "#{id}, #{name}, #{level_learning}, #{whitelist}, #{noise}"
			id +=1
		end
		student_list
	end
	private 
		def numToLetter(x)
		    if x == 0
		        l = "J"
		    elsif x == 1
		        l = "I"
		    elsif x == 2
		        l = "H"
		    elsif x == 3
		        l = "G"
		    elsif x == 4
		        l = "F"
		    elsif x == 5
		        l = "E"
		    elsif x == 6
		        l = "D"
		    elsif x == 7
		        l = "C"
		    elsif x == 8
		        l = "B"
		    elsif x == 9
		        l = "A"
		    end
		end
end

seats = Seating.new














