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
    player_name
  end

  def add_players
    2.times { @player_list << Player.new }
  end

  def player_name
    @player_list.each_with_index do |player, player_num|
      player.update_name(name_prompt(player_num + 1))
    end
  end

  def name_prompt(player_number)
    puts "Player #{player_number}, what is your name?"
    gets.chomp.capitalize
  end
end
