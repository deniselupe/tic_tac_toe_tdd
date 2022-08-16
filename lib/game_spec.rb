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

  describe '#player_name' do
    subject(:two_player_game) { described_class.new(players: [player1, player2]) }
    let(:player1) { instance_double(Player) }
    let(:player2) { instance_double(Player) }

    context 'when there are 2 players' do
      before do
        allow(two_player_game).to receive(:name_prompt)
        allow(player1).to receive(:update_name)
        allow(player2).to receive(:update_name)
      end

      it 'calls #name_prompt twice' do
        expect(two_player_game).to receive(:name_prompt).twice
        two_player_game.player_name
      end

      it 'sends #update_name to each player' do
        two_players = two_player_game.player_list
        expect(two_players).to all(receive(:update_name))
        two_player_game.player_name
      end
    end
  end

  describe '#assign_pieces' do
    subject(:game2) { described_class.new(players: [player1, player2]) }
    let(:player1) { instance_double(Player, name: 'John') }
    let(:player2) { instance_double(Player, name: 'Jane') }

    context 'when there are 2 players' do
      before do
        allow(game2).to receive(:avail_pieces)
        allow(game2).to receive(:game_prompt)
        allow(player1).to receive(:update_piece)
        allow(player2).to receive(:update_piece)
      end

      it 'sends #update_piece to each player' do
        both_players = game2.player_list
        expect(both_players).to all(receive(:update_piece))
        game2.assign_pieces
      end
    end
  end
end
