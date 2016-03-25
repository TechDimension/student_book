class Seating


	#implementation in the website
	# All inputs would be done by forms
	# This page would be a helper
	# all functions can be called by the view
	#implement a saving strategy
	# backup student details to a file 
	# Create a flow chart of this program before implementing to website



	def initialize
		# 0 are available seats.
		puts "Enter the max width of seats, as in max amount of seats in one plane"
		@seats_x = gets.strip.to_i
		puts "Enter array Height of seats"
		@seats_y = gets.strip.to_i
		puts 'Enter number of available seats'
		@available_seats = gets.strip.to_i

		@no_seat = "\u25CB"
		@yes_seat = "\u25C9"
		if @available_seats >= @seats_x * @seats_y
			"error"
		else
			"continue"
		end
	end

	def class_layout
		row_array = []
		seat_array =  []
		index_row = []
	    for y in (0..@seats_y-1)
		    for x in  (0..@seats_x-1)
		    	index_row << x + 1     
		        row_array << @no_seat
		    end
		    seat_array << row_array
		    row_array = []
		end
		print_layout(seat_array)
		seat_array
	end

	def seat_layout
		new_layout = class_layout
		for i in 0..(@available_seats-1)
			puts "Enter seat layout"
			puts "#{i+1}: Enter Position for an available seat Example: B5"
			position = gets.strip
			if position.length == 2 
				x_pos = ( position[1].to_i - 1 )
				y_pos = letter_to_num(position[0].upcase)
				if new_layout[x_pos][y_pos] == @yes_seat
					puts "Already used please do again"
					i -= 1
				else
					new_layout[y_pos][x_pos] = @yes_seat
				end
			else
				"incorrect Info"
			end
			print_layout(new_layout)
		end
		new_layout
	end

	def algorithm
		#loud students to not be put next to another loud student, / put closer to the front.
		# needing students put on the front.
		# student cannot sit next to their problem partner
		# Everything else fills up the other rows.
		# Fill up so that the back should not be filled.
			# student_list = student_list_data
			# new_list = student_list.sort_by(level_learning)
			# new_list = student_list.map{|student| student.level_learning == 1}
			# student_list.sort_by(noise)
			# student_list.each do |student|
			# 	if student.noise == 3
			# 		#do not put directly next to a studentnoise level of 2/3
			# 		#and put minimum of 3 spaces away from another noise 3 student
			# 	end
			# 	#if seat layout has no more spaces, then allow to be put in the first available empty space. 
			# end

		new_layout = seat_layout.dup
		s_list = student_list_data
		s_list_copy = s_list.dup
		s_list_copy = s_list_copy.sort_by{|k,v| v["level"]}

		print(s_list_copy)
		puts

		# Alternating to boy girl
		#pre requesite questions 
		puts "Do you want the seating plan to have boy girl layout?  y/n"
		male_female = gets.strip.upcase
		puts "Does noise level of students matter? y/n"
		noise_question = gets.strip.upcase
		if male_female == "Y"
			loopy = true
			gender_loop = "M"
			new_s_list = []
	
			
			while loopy == true
				i = 0
				puts i 
				loopy2 = true
				while loopy2 == true

					puts i == i.to_i
					puts i
					print s_list_copy
					puts

					puts s_list_copy[i][1]["gender"]
					if gender_loop == "M"

						if s_list_copy[i][1]["gender"] == "M"
							new_s_list << s_list_copy[i]
							print new_s_list
							puts
							s_list_copy.delete_at(i)
					
							loopy2 = false
						else
							i += 1
						end
					else
						if s_list_copy[i][1]["gender"] == "F"
							new_s_list << s_list_copy[i]
							print new_s_list
							puts
							s_list_copy.delete_at(i)
					
							loopy2 = false
						else
							i += 1
						end
					end
				end
				puts 'conditioner'
				if gender_loop == "M"
					gender_loop = "F"
				else 
					gender_loop = "M"
				end
		
				if s_list_copy.empty? == true 
					loopy2 = false
					loopy = false
				end
			end
		end

		print(new_s_list)
		puts

		# check for first available seats, row by row, then column by column
		coord = []
		
		for y in 0..@seats_y-1
			for x in 0..@seats_x -1
				if new_layout[y][x] == @yes_seat
					coord << [y,x]
				end
			end
		end

		s_list.each do  |key, value|
				id = key
				name = value["name"]
				gender = value["gender"]
				level = value["level"]
				whitelist = value["whitelist"]
				noise = value["noise"]
			
				x_pos = coord[0][1]
				y_pos = coord[0][0]
				

				#make it so that to the right, to the left, to the up, to the down are all checked, and are in 1 space.
				#diagonal counts as 2 grid spaces
				#sort so that level is #1 priority
				#then arranges that into gender
				# then arranges that into whitelists
				#then arranges by noise
				#continue this for the level 2 
				# then with 4
				#any spaces left over, allows for a level 2 to go then a level 3
				# row from A is where priority should go
				#then all the way to Z

				
				 


				if whitelist.empty? == false
					if new_s_list[x_pos - 1]["name"] == whitelist|| new_s_list[x_pos + 1]["name"] == whitelist || new_s_list[y_pos + 1]["name"] == whitelist || new_s_list[y_pos - 1]["name"] == whitelist
						"Do Not place"
					else
						new_layout[y_pos][x_pos] = id
						coord.delete_at(0)
					end
				end



				if noise == 3 || noise == 2
					if new_s_list[x_pos - 1]["noise"] == 3|| new_s_list[x_pos + 1]["noise"] == 3 || new_s_list[y_pos + 1]["noise"] == 3 || new_s_list[y_pos - 1]["noise"] == 3
						"Do Not place"
					else
						new_layout[y_pos][x_pos] = id
						coord.delete_at(0)
					end
				end
				new_layout[y_pos][x_pos] = id
	
		end
		print_layout(new_layout)
	end

	def manual_list
		new_layout = seat_layout
		s_list = student_list_data
		print s_list
		puts
		print_layout(new_layout)
		s_list.each do  |key, value|
			
			puts "Enter Position for Name: #{value["name"]} Example: B5"
			position = gets.strip
			if position.length == 2 
				x_pos = ( position[1].to_i - 1 )
				y_pos = letter_to_num(position[0])
				new_layout[y_pos][x_pos] = 2
				print_layout(new_layout)
			else 
				"incorrect Info"
			end
		end
		puts "FINAL LAYOUT"
		print_layout(new_layout) 
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
			gender = gets.strip.upcase
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
			student_list.merge!("#{id}"  => {"name" => "#{name}", "gender" => "#{gender}", "level" => "#{level_learning}", "whitelist" => "#{whitelist}", "noise" => "#{noise}"})
			id +=1
		end
		student_list
	end

	private 

		def num_to_letter(x)
			x
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

		def print_layout(seat_array)
			for row in 0..@seats_y-1
				if row == 0 
					print "|"
					for i in 0..(seat_array[row].length-1)	
						print "  #{i+1}  "
					end
					print "|"
					puts
				end
				row_array = seat_array[row]
				print(num_to_letter(row),row_array,num_to_letter(row))
				puts
			end
			puts 
		end
end

seats = Seating.new
#seat_layout_for_user = seats.manual_list
seats.algorithm

a= {"1"=>{"name"=>"Matthew", "gender"=>"M", "level"=>"3", "whitelist"=>"Ishak Ik", "noise"=>"2"}, "2"=>{"name"=>"Oliver", "gender"=>"M", "level"=>"2", "whitelist"=>"Matthew", "noise"=>"1" }, "3"=>{"name"=>"Oliver", "gender"=>"F", "level"=>"2", "whitelist"=>"Matthew", "noise"=>"1"}, "4"=>{"name"=>"Oliver", "gender"=>"F", "level"=>"2", "whitelist"=>"Matthew", "noise"=>"1"}}













