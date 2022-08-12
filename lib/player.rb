# frozen_string_literal: true

# Tic-Tac-Toe will use this Player class to instantialize 2 players per game
class Player
  attr_reader :name, :game_piece

  def initialize
    @name = ''
    @game_piece = ''
  end

  def update_name(new_name)
    @name = new_name.to_s
  end
end
