# frozen_string_literal: true

# Tic-Tac-Toe will use this Player class to instantialize 2 players per game
class Player
  attr_accessor :name, :game_piece

  def initialize
    @name = ''
    @game_piece = ''
  end
end
