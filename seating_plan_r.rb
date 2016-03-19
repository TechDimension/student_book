class Seating
	def array_to_coords
		# 1 are available seats.
		puts 'Enter available seats width, and seats length'
		seatLayout =  [[0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0],
						[0,0,0,1,0,0,1,1,1,0,0,1,0,0,0,0,0],
						[0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0],
						[0,0,0,1,0,0,1,1,1,0,0,1,0,0,0,0,0],
						[0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0],
						[0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0],
						[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]
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
		while loopy = true
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
			student_list << "#{id, name, noise, whitelist, level}"
			id ++
		end
		student_list
	end
end