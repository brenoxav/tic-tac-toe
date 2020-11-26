require_relative '../lib/player'

describe 'Player' do
  let(:symbol) { 'X' }
  let(:name) { 'Juan' }
  let(:player) { Player.new(name, symbol) }

  describe 'initialize' do
    it 'Correctly asings name to the player' do
      expect(player.name).to eql name
    end
    it 'Correctly asings symbol to the player' do
      expect(player.symbol).to eql symbol
    end
    it 'Does not change the player symbol' do
      expect(player.symbol == symbol).to_not eql false
    end
  end

  describe 'Class atributes' do
    it 'Correctly get name of the player' do
      expect(player.name).to eql name
    end
    it 'Correctly get symbol of the player' do
      expect(player.symbol == symbol).to_not eql false
    end
    it 'Does not change the player name atribute' do
      expect { player.name = 'Ana' }.to raise_error NoMethodError
    end
    it 'Does not change the player symbol atribute' do
      expect { player.symbol = 'O' }.to raise_error NoMethodError
    end
  end
end
