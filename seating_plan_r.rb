class Seating

	def initialize
		# 0 are available seats.
		puts "Enter the max width of seats, as in max amount of seats in one plane"
		@seats_x = gets.strip.to_i
		puts "Enter array Height of seats"
		@seats_y = gets.strip.to_i
		puts 'Enter number of available seats'
		@available_seats = gets.strip.to_i
	end

	def seat_layout
		row_array = []
		seat_array =  []
		index_row = []
	    for y in (0..@seats_y-1)
		    for x in  (0..@seats_x-1)
		    	index_row << x + 1     
		        row_array << 0
		    end
		    if y == 0
		    	print("|#{index_row}|")
		    	puts
		    end
		    letter = num_to_letter(y)
		    seat_array << row_array
		    print(letter,row_array,letter)
		    row_array = []
		    puts
		end
		seat_array
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

	def manual_list
		s_list = student_list_data
		new_layout = seat_layout
		print(new_layout)
		puts
		puts
		
		s_list.each |id, value| do 
			puts "Enter position for #{value[:name]}. Example 5A"
			position = gets.strip
			if postion.length == 2 
				x_pos = letter_to_num(position[0])
				y_pos = posiiton[1]
			end
		end
		

	end
	def student_list_data
		puts 'Enter Class name'
		classname = gets.strip

		student_list = Hash.new
		id = 1
		loopy = true 
		while loopy == true
			puts 'Enter Student Name'
			name = gets.strip
			puts "Student male or female m/f"
			gender = gets.strip
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
			student_list.merge!("#{id}"  => [{:name => "#{name}"}, {:gender => "#{gender}"}, {:level => "#{level_learning}"}, {:whitelist => "#{whitelist}"}, {:noise => "#{noise}"}])
			id +=1
		end
		student_list
	end
	private 
		def num_to_letter(x)
			x.upcase!
		    if x == 0
		        l = "A"
		    elsif x == 1
		        l = "B"
		    elsif x == 2
		        l = "C"
		    elsif x == 3
		        l = "D"
		    elsif x == 4
		        l = "E"
		    elsif x == 5
		        l = "F"
		    elsif x == 6
		        l = "G"
		    elsif x == 7
		        l = "H"
		    elsif x == 8
		        l = "I"
		    elsif x == 9
		        l = "J"
		    end
		    l
		end

		def letter_to_num(x)
		    if x == "A"
		        l = 0
		    elsif x == "B"
		        l = 1
		    elsif x == "C"
		        l = 2
		    elsif x == "D"
		        l = 3
		    elsif x == "E"
		        l = 4
		    elsif x == "F"
		        l = 5
		    elsif x == "G"
		        l = 6
		    elsif x == "H"
		        l = 7
		    elsif x == "I"
		        l = 8
		    elsif x == "J"
		        l = 9
		    end
		    l
		end
end

seats = Seating.new
#seat_layout_for_user = seats.manual_list

print(seats.manual_list)

puts













