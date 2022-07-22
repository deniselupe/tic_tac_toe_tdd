require_relative '../lib/game.rb'

describe Game do
  describe '#add_players' do
    subject(:game1) { described_class.new }

    context 'when adding players' do
      it '@player_list receives :<< twice' do
        expect(game1.player_list).to receive(:<<).twice
        game1.add_players
      end

      it 'changes length of @player_list by two' do
        expect { game1.add_players }.to change { game1.player_list.length }.from(0).to(2)
      end

      it 'Player instances append to @player_list' do
        game1.add_players
        players = game1.player_list
        expect(players).to all(be_an_instance_of(Player))
      end
    end
  end
end
