# frozen_string_literal: true

require_relative 'player'

# This is the game class that defines the behaviors and attributes for Tic-Tac-Toe
class Game
  attr_reader :player_list

  def initialize(players: [])
    @player_list = players
  end

  def game_start
    add_players
  end

  def add_players
    2.times { @player_list << Player.new }
  end
end
