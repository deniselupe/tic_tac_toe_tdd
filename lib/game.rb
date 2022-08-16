# frozen_string_literal: true

require_relative 'player'

# This is the game class that defines the behaviors and attributes for Tic-Tac-Toe
class Game
  attr_reader :player_list

  def initialize(players: [])
    @player_list = players
    @game_pieces = %w[X O]
  end

  def game_start
    add_players
    player_name
    assign_pieces
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
    print "Player #{player_number}, what is your name? "
    gets.chomp.capitalize
  end

  def assign_pieces
    @player_list.each_with_index do |player, _index|
      player.update_piece(game_piece_selector(player.name))
    end
  end

  def avail_pieces
    clear
    puts 'Game pieces available:'
    @game_pieces.each { |piece| puts piece }
  end

  def game_piece_selector(player_name)
    if @game_pieces.length > 1
      game_prompt(player_name)
    else
      remainder_piece(player_name)
    end
  end

  def game_prompt(player_name)
    loop do
      avail_pieces
      puts "\n#{player_name}, select a game piece from the available options:"
      game_piece = gets.chomp.upcase

      if @game_pieces.include?(game_piece)
        @game_pieces.delete(game_piece)
        return game_piece
      end
    end
  end

  def remainder_piece(player_name)
    avail_pieces
    puts "\n#{player_name}, you are assigned game piece: #{@game_pieces[0]}"
    @game_pieces.delete(@game_pieces[0])
  end

  def clear
    print "\e[2J\e[H"
  end
end
