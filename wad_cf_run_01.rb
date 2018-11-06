# Ruby code file - All your code should be located between the comments provided.

# Add any additional gems and global variables here
require 'sinatra'

# The file where you are to write code to pass the tests must be present in the same folder.
# See http://rspec.codeschool.com/levels/1 for help about RSpec
require "#{File.dirname(__FILE__)}/wad_cf_gen_01"

# Main program
module CF_Game
	@input = STDIN
	@output = STDOUT
	g = Game.new(@input, @output)
	playing = true
	input = ""
	option = 0
	turn = 0
	placed = nil
		
	@output.puts 'Enter "1" runs game in command-line window or "2" runs it in web browser.'
	game = g.getinput
	if game == "1"
		@output.puts "Command line game"
	elsif game == "2"
		@output.puts "Web-based game"
	else
		@output.puts "Invalid input! No game selected."
		exit
	end
		
	if game == "1"
		
	# Any code added to command line game should be added below.

		##Run the game
		g.start
		g.clearcolumns
		g.displayframecolumnvalues

		player = g.getplayer1

		until g.checkwinner() == 1 or g.checkwinner() == 2 #This pulls errors occasionally... I think the diagonal code is a little broken
			#Place Piece
			puts "pick a column from 1-6 to drop your piece"
			column = gets.chomp.to_i

			if (column.between?(1, 6))
				index = 6
				while g.getcolumnvalue(index,column-1) != "_"
					index -=1
				end
				g.setmatrixcolumnvalue(index, column-1, player)
				g.displayframecolumnvalues

				#change_turn
				#This part is kind of awkward when someone wins but whatever
				if player == g.getplayer1
					puts "Player 2's Turn"
					player = g.getplayer2
				elsif player == g.getplayer2
					puts "Player 1's Turn"
					player = g.getplayer1
				end
			else
				puts "Invalid move, try again"
			end

			# check_for_winner
			if g.checkwinner() == 1
				puts "Player 1 wins!"
			elsif g.checkwinner() == 2
				puts "Player 2 wins!"
			end
		end
	
	# Any code added to output the activity messages to the command line window should be added above.

		exit	# Does not allow command-line game to run code below relating to web-based version
	end

end
# End modules

# Sinatra routes

	# Any code added to output the activity messages to a browser should be added below.



	# Any code added to output the activity messages to a browser should be added above.

# End program