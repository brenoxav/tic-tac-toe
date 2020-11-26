require_relative '../lib/game'

describe 'TicTacToe' do
  let(:symbol) { 'X' }
  let(:name1) { 'Juan' }
  let(:name2) { 'Jose' }
  let(:game) { TicTacToe.new(symbol, name1, name2) }
  describe '#initialize' do
    it 'Creates a game with an empty board' do
      expect(game.board).to eql [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    end
    it 'Starts the game with player 1' do
      expect(game.get_player_name).to_not eql name2
    end
  end
  describe '#valid?' do
    it 'Succesully denies movements in negative positions' do
      expect(game.valid?(-1)).to_not eql true
    end
    it 'Succesully denies movements in positions bigger than 9' do
      expect(game.valid?(10)).to eql false
    end
    it 'Succesully denies movements in occupied positions' do
      game.make_movement 4
      expect(game.valid?(4)).to eql false
    end
    it 'Succesully accepts movements in valid positions' do
      expect(game.valid?(5)).to eql true
    end
  end
  describe '#make_movement' do
    it 'Successfully makes a new movement' do
      game.make_movement 4
      expect(game.board).to eql [' ', ' ', ' ', 'X', ' ', ' ', ' ', ' ', ' ']
    end
    it 'Successfully makes a new movement for both players' do
      game.make_movement 4
      game.make_movement 5
      expect(game.board).to eql [' ', ' ', ' ', 'X', 'O', ' ', ' ', ' ', ' ']
    end
    it 'Does not make_movements if the position is taked' do
      game.make_movement 4
      game.make_movement 5
      expect(game.make_movement(4)).to_not eql true
    end
  end

  describe '#draw?' do
    it "Does not returns true if there's empty positions" do
      expect(game.draw?).to_not eql true
    end
    it 'Returns true if the game is draw' do
      game.make_movement 1
      game.make_movement 2
      game.make_movement 3
      game.make_movement 4
      game.make_movement 5
      game.make_movement 6
      game.make_movement 7
      game.make_movement 8
      game.make_movement 9
      expect(game.draw?).to eql true
    end
  end
  describe '#did_win?' do
    it 'Does not returns true if no player have won' do
      expect(game.did_win?).to_not eql true
    end
    it "Returns true if there's a column" do
      game.make_movement 1
      game.make_movement 2
      game.make_movement 4
      game.make_movement 5
      game.make_movement 7
      expect(game.did_win?).to eql true
    end
    it "Returns true if there's a row" do
      game.make_movement 1
      game.make_movement 4
      game.make_movement 2
      game.make_movement 5
      game.make_movement 3
      expect(game.did_win?).to eql true
    end
    it "Returns true if there's a diagonal" do
      game.make_movement 1
      game.make_movement 4
      game.make_movement 5
      game.make_movement 6
      game.make_movement 9
      expect(game.did_win?).to eql true
    end
  end
  describe '#get_player_name' do
    it 'Does not return player 2 name at the start' do
      expect(game.get_player_name).to_not eql name2
    end
    it 'Returns player 1 name at the start' do
      expect(game.get_player_name).to eql name1
    end
    it 'Returns player 2 name at the start if we ask for the oposite player' do
      expect(game.get_player_name(true)).to eql name2
    end
    it 'Returns player 2 if it is player 2 turn' do
      game.make_movement 6
      expect(game.get_player_name).to eql name2
    end
    it 'Returns player 1 name if it is player 2 turn and we ask for the oposite' do
      game.make_movement 6
      expect(game.get_player_name(true)).to eql name1
    end
  end
end
