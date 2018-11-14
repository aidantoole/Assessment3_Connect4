# https://www.primarysite-kidszone.co.uk/kidszone/resources/connect4.htm
# Ruby code file - All your code should be located between the comments provided.

# Add any additional gems and global variables here
# require 'sinatra'		# remove '#' character to run sinatra wen server

# Main class module
module CF_Game
	# Input and output constants processed by subprocesses. MUST NOT change.
	TOKEN1 = "O"
	TOKEN2 = "X"

	class Game
		attr_reader :matrix, :player1, :player2, :template, :input, :output, :turn, :turnsleft, :winner, :played, :score, :resulta, :resultb, :guess
		attr_writer :matrix, :player1, :player2, :template, :input, :output, :turn, :turnsleft, :winner, :played, :score, :resulta, :resultb, :guess
		
		def initialize(input, output)
			@input = input
			@output = output
		end
		
		def getinput
			txt = @input.gets.chomp
			return txt
		end
		
		# Any code/methods aimed at passing the RSpect tests should be added below.

		def created_by()
			@myname = "Aidan, George, and Kieran"
		end

		def student_id()
			@studentid = 51877490
		end

		def start
			@output.puts "Welcome to Connect 4!" 
			@output.puts "Created by:" + @myname.to_s
			@output.puts "Game started."
			@output.puts "Player 1: O and Player 2: X"
			@output.puts "Enter column number to place token."
		end
		
		def displaybegingame
			@output.puts "Begin game."
		end

		def displaynewgamecreated
			@output.puts "New game created."
		end

		def finish
			@output.puts "Game finished."
		end

		def displaymenu
			@output.puts("Menu: (1)Start | (2)New | (9)Exit\n")
		end

		def displayplayer1prompt
			@output.puts("Player 1 to enter token (0 returns to menu).")
		end

		def displayplayer2prompt
			@output.puts("Player 2 to enter token (0 returns to menu).")
		end

		def displayinvalidinputerror
			@output.puts("Invalid input.")
		end

		def displaynomoreroomerror
			@output.puts('No more room.')
		end

		def displaywinner(p)
			@output.puts("Player #{p} wins.")
		end

		def setplayer1
			return self.player1
		end

		def getplayer1
			TOKEN1
		end

		def player1
			TOKEN1
		end

		def setplayer2
			return self.player2
		end

		def getplayer2
			TOKEN2
		end

		def player2
			TOKEN2
		end

		def clearcolumns
			@matrix = [
				["_", "_", "_", "_", "_", "_"],
				["_", "_", "_", "_", "_", "_"],
				["_", "_", "_", "_", "_", "_"],
				["_", "_", "_", "_", "_", "_"],
				["_", "_", "_", "_", "_", "_"],
				["_", "_", "_", "_", "_", "_"],
				["_", "_", "_", "_", "_", "_"]
			]
		end

		def getcolumnvalue(one, two)
			@matrix[one][two]
			# "_"
		end

		def setmatrixcolumnvalue(c, i, v)
			if @matrix[c][i] == "_"
				@matrix[c][i]=v
			end
		end

		def displayemptyframe
			title = " 1 2 3 4 5 6 7 "
			rowdivider = "+-+-+-+-+-+-+-+"
			rowempty = "|_|_|_|_|_|_|_|"
			@output.puts("#{title}")

			for i in 1..7
				@output.puts("#{rowdivider}")
			end

			for i in 1..6
				@output.puts("#{rowempty}")
			end
		end

		def displayframecolumnvalues
			@matrix.each do |row|
				puts ' ' + row.join(' ')
			end

			title = " 1 2 3 4 5 6 "
			rowdivider = "+-+-+-+-+-+-+-+"
			rowempty = "|_|_|_|_|_|_|_|"
			@output.puts("#{title}")
		end


		def checkwinner(a, b,player)
			vertical = 0		#(|)
			horizontal = 0		#(-)
			diagonal1 = 0		#(\)
			diagonal2 = 0		#(/)
			player = @matrix[a][b];
			
			#check for vertical(|)
			i  = a
		
			while @matrix[i][b] == player && i <= 5 do
				vertical = vertical + 1
				i = i + 1 
			end
			
			#Check down
			i = a 
			while @matrix[i][b] == player && i >= 0 do
				vertical = vertical + 1
				i = i - 1 
			end
			
			if vertical >= 4
				return true
			end
			
			#check for horizontal(-)
			ii = b 
			#check left
			while @matrix[a][ii] == player && ii>=0 do
				ii = ii - 1
				horizontal = horizontal + 1
			end
			ii = b 
			while @matrix[a][ii] == player && ii <= 6 do
				ii = ii + 1
				horizontal = horizontal + 1
			end 
			
			if horizontal >= 5 
				return true
			end
			#check for diagonal 1 (\)
			#up and left
			i = a 
			ii = b 
			while @matrix[i][ii] == player && i>=0 && ii >= 0 do
				i = i - 1
				ii = ii - 1
				diagonal1 = diagonal1 + 1
			end
			
			i = a 
			ii = b 
			while @matrix[i][ii] == player && i<=5 && ii <=6 do
				i = i + 1
				ii = ii + 1
				diagonal1 = diagonal1 + 1
			end
			if diagonal1 >= 4
				return true
			end

			#check for diagonal 2(/)
			#up and right
			i = a 
			ii = b 

			while @matrix[i][ii] == player && i>=0 && ii<=6 do
				i = i - 1
				ii = ii +1
				diagonal2 = diagonal2 + 1
			end
			i = a  
			ii = b 
			while @matrix[i][ii] == player && i<=5 && ii>=0 do
				i = i + 1
				ii = ii - 1
				diagonal2 = diagonal2 + 1
			end 
			if diagonal2 >= 4
				return true
			end
			
		end

		# Any code/methods aimed at passing the RSpect tests should be added above.

	end
end
