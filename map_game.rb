# Set inventory and door locked status
$items = []
$black_door_open = false 

# Set key states 
$red_key_acquired = false 
$blue_key_acquired = false 
$yellow_key_acquired = false 

def center_room  

	puts "You are in large square room with four doors of different colors."
	puts "Do you wish to go through the black, red, yellow or blue door?"
	print "> "
	
	# Checking keys to see if black door can be unlocked
	if $items.length == 3 
		$black_door_open = true
	else 
		$black_door_open = false
	end
	
	direction = gets.chomp
	
	if (direction == 'red') & ($red_key_acquired == false) 
		red_room
	elsif (direction == 'blue') & ($blue_key_acquired == false) 
		blue_room
	elsif (direction == 'yellow') & ($yellow_key_acquired == false)
		yellow_room
	elsif (direction == 'black') & ($black_door_open == true) 
		puts "You place the three keys inside the lock and it clicks!"
		puts "At last, you might get out of here yet!"
		black_room
	elsif (direction == 'black') & ($black_door_open == false) 
		puts "You cannot open the door! It seems to require several keys that you don't have."
		puts "So far you have..."
		
		$items.each {|item| puts "A" + item } 
		
		puts "So once again..."
		center_room
	else 
		puts "Are you certain you mean that? I think you've been there before"
		puts "or you can't type."
		center_room
	end
end

def red_room
 
	# Riddle 
	puts "You have chosen to enter the red room."
	puts "You open the door and walk down a narrow, dark path."
	puts "When you come at long last to a big steel door, you see a small screen."
	puts "It says, 'Welcome to the Game.'"
	
	puts "Here's how this works."
	puts "I will give you a scrambled phrase, and you must tell me the answer."
	puts "You only get two tries."
	
	puts "If you re-arrange me, I'm a past-time, but I'm far past my time today."
	puts "lebealsba"
	
	counter = 0 
	while counter < 2 

	  try = 3 - counter
		puts "Try ##{try}: Don't mess up!"
		print "> "
		choice = $stdin.gets.chomp.downcase
		
		if choice == "baseball" 
			puts "Very well, look at this brain trust."
						
			puts "Inside you check around until you see a small, red box."
			puts "Inside there is a red key!"
			
			$items.push("Redkey")
			$red_key_acquired = true
				
	
			# Option to go back 
			print $items
			puts "Do you want to go back to the center room? yes or no."
			puts "If you don't you will try to find a way out here."
			print "> "
			go_back = gets.chomp
			
			if go_back == 'yes'
				center_room
			else 
				puts "You try to find a way out, but cannot."
				you_die
			end	
			
		else 
			counter += 1
		end		
		
	end
	
	puts "Now it's time to die punk!"
	you_die	

end

def blue_room

	# Riddle 
	puts "You have entered the blue room."
	# Find key
	
	puts "You have found the red key!"
	$items.push("Bluekey")
	$blue_key_acquired = true
	
	# Option to go back 
	print $items
	puts "Do you want to go back to the center room? Yes or no."
	puts "If you don't you will try to find a way out here."
	print "> "
	go_back = gets.chomp
	
	if go_back == 'yes'
		center_room
	else 
		puts "You try to find a way out, but cannot."
		you_die
	end	

end

def yellow_room
	# Riddle 
	puts "You have entered the yellow room."
	# Find key
	
	puts "You have found the red key!"
	$items.push("Yellowkey")
	$yellow_key_acquired = true
	
	# Option to go back 
	print $items
	puts "Do you want to go back to the center room? Yes or no."
	puts "If you don't you will try to find a way out here."
	print "> "
	go_back = gets.chomp
	
	if go_back == 'yes'
		center_room
	else 
		puts "You try to find a way out, but cannot."
		you_die
	end	
end

def black_room
	# Door unlocked sequence 
	
	# Final boss
	
	# you win message 
end

def you_die
	puts "Out of the ceiling the Alien from those 1980s movies comes and bites your head off."
	puts "Care to play again? Yes or no."
	print "> "
	play_again = gets.chomp
	
	if play_again == 'yes'
		center_room
	else 
		puts "Maybe next time you will finish the challenge!"
	end
end

# Intro story that explains where you are
puts "Welcome to the first edition of the Map Game!" 
puts "In this game, you work to find out where the map is and escape!"
puts "Be wary though, trials and tribulations await you!"
center_room