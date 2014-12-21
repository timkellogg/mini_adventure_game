# Set inventory and door locked status
$items = []
$black_door_open = false 


def you_die
	puts "You have died."
	puts "It's all over." 
end

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
		
		$items.each {|item| puts "A " + item } 
		
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
	puts "If you re-arrange me, I'm a past-time, but I'm far past my time today."
	puts "lebealsba"
	
	print "> "
	choice = $stdin.gets.chomp.downcase
		
	if choice == "baseball" 
		puts "Very well, look at this brain trust."
						
		puts "Inside you check around until you see a small, red box."
		puts "Inside there is a red key!"
			
		$items.push("Redkey")
		$red_key_acquired = true
		
		# Go back to center room
		center_room	
				
	else
		you_die
	end		
end
	
def yellow_room
 
	# Riddle 
	puts "You have chosen to enter the yellow room."
	puts "You open the door and immediately see a large room glowing with fire."
	puts "There's a river of lava surrounding a giant block of concrete in the center."
	puts "On the block there is a table with a small box."
	puts "You hear a voice say, 'Welcome to your final resting place.'"
	
	puts "Here's how this works."
	puts "You will have choose a way to get across the lava"
	puts "Choose carefully because if you select wrong, you will die."
	
	# Option 1 the Zipline 
	puts "Option 1: Take the zipline you see above. It may or may not break."
	puts "Do you wish to 'take' or 'pass' on this option?"
	print "> "
	option_1 = $stdin.gets.chomp
	
	if option_1 == 'take'
		puts "Very well. Have a try."
		puts "You nervously get on the line and slowly start going."
		puts "You find that the zipline brings you to the other side safely."
		puts "You open the small box and find a key!" 
		
		$items.push("Yellowkey")
		$yellow_key_acquired = true
		
		# Go back to center room
		center_room	
		
	else 
	
	# Option 2 the boat 
		puts "Very well, we shall see if you come to regret that decision." 
		puts "Option 2: Take the small boat across."
		puts "Do you wish to 'take' or 'pass' on this option?"
		print "> "
		option_2 = $stdin.gets.chomp
		
		if option_2 == 'take' 
			puts "You step into the small boat."
			puts "As you make your way across, you realize your stupid mistake-"
			puts "The boat is made of wood!"
			puts "You are too far out to go back and you burn to death horribly."
			you_die
		
		else 
			# Option 3 Too late 
			puts "Very well, we shall see if you come to regret this second decision." 
			puts "Option 3: Death."
			puts "Do you wish to 'take' or 'pass' on this option?"
			print "> "
			option_2 = $stdin.gets.chomp
			
			puts "Oh, you thought there was another option?" 
			puts "You have no say in this anymore - you already passed!"
			puts "*Insects come from the floor and slowly eat you to death as you struggle to get away."
			you_die
		end
	end

end

def blue_room
 
	# Riddle 
	puts "You have chosen to enter the blue room."
	puts "You open the door and find a peculiar looking woman leaning up against a chalkboard."
	puts "'Hello, welcome to your next challenge. Do you remember math?'"
	puts "'I ask because if you don't, you will surely be blue.'"
	puts "It says, 'Welcome to the Game.'"
	
	puts "Here's how this works."
	puts "I will give you a problem. You have one shot. If you answer wrong. You will perish."
	
	puts "What is 5 + 2 - 12 / 15 * 3 + 120 - 56?"
	puts "Oh, and no rounding!"
	
	puts "You walk up to the chalkboard and write..."
	print "> "
	
	math_problem_answer = $stdin.gets.chomp
	
	if math_problem_answer.to_f == 68.6 
		puts "Well, I didn't forbid calculators so no wonder you got it right."
					
		puts "Very well. Take this. You'll need it!"
				
		$items.push("Bluekey")
		$blue_key_acquired = true
		
		print $items	
		
		# Go back to center room
		center_room	
		
	else
		puts "Well, that's too bad now isn't it."
		puts "*Immediately a hole in the ground opens up and you fall to your death.*"
		you_die	
	end

end

def black_room
	# Door unlocked sequence 
	puts "Inside a dark little room at the long end of a hallway, you find a little desk."
	puts "Strangely, you check around until you find a last little box."
	puts "In this box, there is a small map."
	puts "Looking closely at it, you realize that this is what you were waiting for."
	puts "You look forward opening the final door and with the directions out, you start making your way."
	puts "*Congrats on making it out alive!"
end


# Intro story that explains where you are
puts "Welcome to the first edition of the Map Game!" 
puts "In this game, you work to find out where the map is and escape!"
puts "Be wary though, trials and tribulations await you!"
center_room