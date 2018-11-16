# Ruby code file - All your code should be located between the comments provided.

# Add any additional gems and global variables here
require 'sinatra'
require 'sinatra/reloader'

# The file whe  re you are to write code to pass the tests must be present in the same folder.
# See http://rspec.codeschool.com/levels/1 for help about RSpec
require "#{File.dirname(__FILE__)}/wad_cf_gen_01"

# Main program
module CF_Game
	@input = STDIN
	@output = STDOUT
	$g = Game.new(@input, @output)
	playing = true
	input = ""
	option = 0
	turn = 0
	placed = nil
	
	@output.puts 'Enter "1" runs game in command-line window or "2" runs it in web browser.'
	game = $g.getinput
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
		
			$g.created_by()

			#Put menu here
			puts"Menu: type 'new' to start a new game, 'resume' to resume, or 'quit' to exit"
			val = gets.chomp.to_s

			if val == "new"
				$g.clearcolumns
				$g.start 
			elsif val == "quit"
				abort("game over")
			elsif val == "resume" #This part needs work
				$g.clearcolumns #This shouldn't reset right?
				$g.start 
			else
				puts"Invalid input"
				exit
			end
			
			
			$g.displayframecolumnvalues

			player = $g.getplayer1
			index  = 0
			column = 0
			finished = 0			# if finished = 1 the game displays the winning message 
			while finished == 0 do #diagonal is fixed but it's still buggy
				#Place Piece
				puts "pick a column from 1-6 to drop your piece"
				column = gets.chomp.to_i - 1

				if (column.between?(0, 5))
					index = 6
					while $g.getcolumnvalue(index,column) != "_"
						index -=1
					end
					$g.setmatrixcolumnvalue(index, column, player)
					$g.displayframecolumnvalues
					if $g.checkwinner(index,column,player)
						puts "Game is done #{player} wins" #Sometimes throws a win if there's 3 in a row
						finished = 1
						exit
					end

					#change_turn
					#This part is kind of awkward when someone wins but whatever
					if player == $g.getplayer1
						puts "Player 2's Turn"
						player = $g.getplayer2
					elsif player == $g.getplayer2
						puts "Player 1's Turn"
						player = $g.getplayer1
					end
				else
					puts "Invalid move, try again"
				end

				# check for winner
				if $g.checkwinner(index,column,player) == 'O'
					puts "Player 1 wins!"
				elsif $g.checkwinner(index,column,player) == 'X'
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

$g.start 
$g.clearcolumns
$player = $g.getplayer1
@index  = 0
@column = 0
$finished = 0	
get '/frank-says' do
	redirect to ('/')
end

get '/' do
	@move = "asd"
	erb :homeCF
end

post '/play_move' do
	if $finished == 0 
		move = params[:move]
		column = move.to_i - 1 
		@player = $g.getplayer1
		if (column.between?(0, 5))
			index = 6
			while $matrix[index][column] != "_"
				index -=1
			end
			if $matrix[index][column] == "_"
				$matrix[index][column]= $player
			end
			if $g.checkwinner(index,column,$player)				
				$finished = 1
			end
		end	
		if $player == 'O'
			$player = 'X'
		elsif $player == 'X'
			$player = 'O'
		end
	end
	erb :homeCF
end



	# Any code added to output the activity messages to a browser should be added above.

# End program
