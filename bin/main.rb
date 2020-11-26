require './lib/game'

tic_tac_toe = nil
def clear
  system 'clear' or system 'cls'
end

def put_board(arr)
  puts "\nBoard:          Positions:\n\n"
  puts "  #{arr[6]}  |  #{arr[7]}  |  #{arr[8]}     7     8     9"
  puts '_____|_____|_____'
  puts "  #{arr[3]}  |  #{arr[4]}  |  #{arr[5]}     4     5     6"
  puts '_____|_____|_____'
  puts "  #{arr[0]}  |  #{arr[1]}  |  #{arr[2]}     1     2     3"
  puts '     |     |     '
end

clear
puts 'Welcome to Tic Tac Toe!'
puts 'Do you want to start with "X" or "O"?'

loop do
  symbol = gets.chomp.upcase
  if %w[X O].include?(symbol)
    puts 'Player 1 name:'
    player1 = gets.chomp
    puts 'Player 2 name:'
    player2 = gets.chomp
    tic_tac_toe = TicTacToe.new(symbol, player1, player2)
    puts 'Game started!'
    break
  else
    puts 'Do you want to start with "X" or "O"?'
  end
end

clear

loop do
  put_board tic_tac_toe.board
  puts "It's #{tic_tac_toe.get_player_name} turn"
  puts 'Choose your next movement!'
  movement = gets.chomp.to_i
  clear
  if tic_tac_toe.valid? movement
    puts 'Now, your move is displayed on the board!'
    tic_tac_toe.make_movement movement
  else
    puts 'Invalid movement!!!!'
    next
  end

  if tic_tac_toe.did_win?
    clear
    put_board tic_tac_toe.board
    puts "Player #{tic_tac_toe.get_player_name true} have won!"
    break
  end
  next unless tic_tac_toe.draw?

  clear
  put_board tic_tac_toe.board
  puts 'We have a Draw!'
  break
end
