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

		def checkwinner()

			# check rows
			i = 0
			while i < 7 do
				#Player 1
				if @matrix[i][0] == TOKEN1 and @matrix[i][1] == TOKEN1 and @matrix[i][2] == TOKEN1 and @matrix[i][3] == TOKEN1
					@winner = 1
				elsif @matrix[i][1] == TOKEN1 and @matrix[i][2] == TOKEN1 and @matrix[i][3] == TOKEN1 and @matrix[i][4] == TOKEN1
					@winner = 1
				elsif @matrix[i][2] == TOKEN1 and @matrix[i][3] == TOKEN1 and @matrix[i][4] == TOKEN1 and @matrix[i][5] == TOKEN1
					@winner = 1
				#Player 2
				elsif @matrix[i][0] == TOKEN2 and @matrix[i][1] == TOKEN2 and @matrix[i][2] == TOKEN2 and @matrix[i][3] == TOKEN2
					@winner = 2
				elsif @matrix[i][1] == TOKEN2 and @matrix[i][2] == TOKEN2 and @matrix[i][3] == TOKEN2 and @matrix[i][4] == TOKEN2
					@winner = 2
				elsif @matrix[i][2] == TOKEN2 and @matrix[i][3] == TOKEN2 and @matrix[i][4] == TOKEN2 and @matrix[i][5] == TOKEN2
					@winner = 2
				end
				i = i + 1
			end

			# check columns
			i = 0
			while i < 6 do
				#Player1
				if @matrix[0][i] == TOKEN1 and @matrix[1][i] == TOKEN1 and @matrix[2][i] == TOKEN1 and @matrix[3][i] == TOKEN1
					@winner = 1
				elsif @matrix[1][i] == TOKEN1 and @matrix[2][i] == TOKEN1 and @matrix[3][i] == TOKEN1 and @matrix[4][i] == TOKEN1
					@winner = 1
				elsif @matrix[2][i] == TOKEN1 and @matrix[3][i] == TOKEN1 and @matrix[4][i] == TOKEN1 and @matrix[5][i] == TOKEN1
					@winner = 1
				elsif @matrix[3][i] == TOKEN1 and @matrix[4][i] == TOKEN1 and @matrix[5][i] == TOKEN1 and @matrix[6][i] == TOKEN1
					@winner = 1
				#Player2
				elsif @matrix[0][i] == TOKEN2 and @matrix[1][i] == TOKEN2 and @matrix[2][i] == TOKEN2 and @matrix[3][i] == TOKEN2
					@winner = 2
				elsif @matrix[1][i] == TOKEN2 and @matrix[2][i] == TOKEN2 and @matrix[3][i] == TOKEN2 and @matrix[4][i] == TOKEN2
					@winner = 2
				elsif @matrix[2][i] == TOKEN2 and @matrix[3][i] == TOKEN2 and @matrix[4][i] == TOKEN2 and @matrix[5][i] == TOKEN2
					@winner = 2
				elsif @matrix[3][i] == TOKEN2 and @matrix[4][i] == TOKEN2 and @matrix[5][i] == TOKEN2 and @matrix[6][i] == TOKEN2
					@winner = 2
				end
				i = i + 1
			end

			# check diagonals left to right
			i = 0
			while i < 4 do
				#Player1
				if @matrix[i][0] == TOKEN1 and @matrix[i+1][1] == TOKEN1 and @matrix[i+2][2] == TOKEN1 and @matrix[i+3][3] == TOKEN1
					@winner = 1
				elsif @matrix[i+1][0] == TOKEN1 and @matrix[i+2][1] == TOKEN1 and @matrix[i+3][2] == TOKEN1 and @matrix[i+4][3] == TOKEN1
					@winner = 1
				elsif @matrix[i+2][0] == TOKEN1 and @matrix[i+3][1] == TOKEN1 and @matrix[i+4][2] == TOKEN1 and @matrix[i+5][3] == TOKEN1
					@winner = 1
				elsif @matrix[i][1] == TOKEN1 and @matrix[i+1][2] == TOKEN1 and @matrix[i+2][3] == TOKEN1 and @matrix[i+3][4] == TOKEN1
					@winner = 1
				elsif @matrix[i+1][1] == TOKEN1 and @matrix[i+2][2] == TOKEN1 and @matrix[i+3][3] == TOKEN1 and @matrix[i+4][4] == TOKEN1
					@winner = 1
				elsif @matrix[i+2][1] == TOKEN1 and @matrix[i+3][2] == TOKEN1 and @matrix[i+4][3] == TOKEN1 and @matrix[i+5][4] == TOKEN1
					@winner = 1
				elsif @matrix[i][2] == TOKEN1 and @matrix[i+1][3] == TOKEN1 and @matrix[i+2][4] == TOKEN1 and @matrix[i+3][5] == TOKEN1
					@winner = 1
				elsif @matrix[i+1][2] == TOKEN1 and @matrix[i+2][3] == TOKEN1 and @matrix[i+3][4] == TOKEN1 and @matrix[i+4][5] == TOKEN1
					@winner = 1
				elsif @matrix[i+2][2] == TOKEN1 and @matrix[i+3][3] == TOKEN1 and @matrix[i+4][4] == TOKEN1 and @matrix[i+5][5] == TOKEN1
					@winner = 1
				elsif @matrix[i][3] == TOKEN1 and @matrix[i+1][4] == TOKEN1 and @matrix[i+2][5] == TOKEN1 and @matrix[i+3][6] == TOKEN1
					@winner = 1
				elsif @matrix[i+1][3] == TOKEN1 and @matrix[i+2][4] == TOKEN1 and @matrix[i+3][5] == TOKEN1 and @matrix[i+4][6] == TOKEN1
					@winner = 1
				elsif @matrix[i+2][3] == TOKEN1 and @matrix[i+3][4] == TOKEN1 and @matrix[i+4][5] == TOKEN1 and @matrix[i+5][6] == TOKEN1
					@winner = 1
				#Player2
				elsif @matrix[i][0] == TOKEN2 and @matrix[i+1][1] == TOKEN2 and @matrix[i+2][2] == TOKEN2 and @matrix[i+3][3] == TOKEN2
					@winner = 2
				elsif @matrix[i+1][0] == TOKEN2 and @matrix[i+2][1] == TOKEN2 and @matrix[i+3][2] == TOKEN2 and @matrix[i+4][3] == TOKEN2
					@winner = 2
				elsif @matrix[i+2][0] == TOKEN2 and @matrix[i+3][1] == TOKEN2 and @matrix[i+4][2] == TOKEN2 and @matrix[i+5][3] == TOKEN2
					@winner = 2
				elsif @matrix[i][1] == TOKEN2 and @matrix[i+1][2] == TOKEN2 and @matrix[i+2][3] == TOKEN2 and @matrix[i+3][4] == TOKEN2
					@winner = 2
				elsif @matrix[i+1][1] == TOKEN2 and @matrix[i+2][2] == TOKEN2 and @matrix[i+3][3] == TOKEN2 and @matrix[i+4][4] == TOKEN2
					@winner = 2
				elsif @matrix[i+2][1] == TOKEN2 and @matrix[i+3][2] == TOKEN2 and @matrix[i+4][3] == TOKEN2 and @matrix[i+5][4] == TOKEN2
					@winner = 2
				elsif @matrix[i][2] == TOKEN2 and @matrix[i+1][3] == TOKEN2 and @matrix[i+2][4] == TOKEN2 and @matrix[i+3][5] == TOKEN2
					@winner = 2
				elsif @matrix[i+1][2] == TOKEN2 and @matrix[i+2][3] == TOKEN2 and @matrix[i+3][4] == TOKEN2 and @matrix[i+4][5] == TOKEN2
					@winner = 2
				elsif @matrix[i+2][2] == TOKEN2 and @matrix[i+3][3] == TOKEN2 and @matrix[i+4][4] == TOKEN2 and @matrix[i+5][5] == TOKEN2
					@winner = 2
				elsif @matrix[i][3] == TOKEN2 and @matrix[i+1][4] == TOKEN2 and @matrix[i+2][5] == TOKEN2 and @matrix[i+3][6] == TOKEN2
					@winner = 2
				elsif @matrix[i+1][3] == TOKEN2 and @matrix[i+2][4] == TOKEN2 and @matrix[i+3][5] == TOKEN2 and @matrix[i+4][6] == TOKEN2
					@winner = 2
				elsif @matrix[i+2][3] == TOKEN2 and @matrix[i+3][4] == TOKEN2 and @matrix[i+4][5] == TOKEN2 and @matrix[i+5][6] == TOKEN2
					@winner = 2
				end
				i = i + 1
			end

			return @winner
		end

		# Any code/methods aimed at passing the RSpect tests should be added above.

	end
end
