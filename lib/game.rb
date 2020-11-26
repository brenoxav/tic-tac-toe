# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Style/ClassVars

require_relative 'player'

class TicTacToe
  attr_accessor :turn
  attr_reader :board

  def initialize(symbol, player1, player2)
    @@player1 = Player.new(player1, symbol)
    @@player2 = Player.new(player2, symbol == 'X' ? 'O' : 'X')
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @turn = true
  end

  def valid?(movement = -1)
    movement.positive? && movement < 10 && board[movement - 1] == ' '
  end

  def make_movement(movement)
    if valid?(movement)
      board[movement - 1] = turn ? @@player1.symbol : @@player2.symbol
      @turn = !turn
      return true
    end
    false
  end

  def draw?
    board.none? ' '
  end

  def did_win?
    symbol = !turn ? @@player1.symbol : @@player2.symbol
    (0..2).each do |i|
      return true if board[0 + (3 * i)] == symbol && board[1 + (3 * i)] == symbol && board[2 + (3 * i)] == symbol
      return true if board[0 + i] == symbol && board[3 + i] == symbol && board[6 + i] == symbol
    end
    return true if board[0] == symbol && board[4] == symbol && board[8] == symbol
    return true if board[2] == symbol && board[4] == symbol && board[6] == symbol

    false
  end

  def get_player_name(oposite = nil)
    if oposite
      !turn ? @@player1.name : @@player2.name
    else
      turn ? @@player1.name : @@player2.name
    end
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Style/ClassVars
