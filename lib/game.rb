# frozen_string_literal: true

require_relative './board'
require_relative './player'

# Tic Tac Toe,a Ruby CLI Application using OOP
class Game
  # initialize the game
  def initialize
    # set up the board
    @board = Board.new

    # set up the players
    @player1 = Player.new('Player1', :x, @board)
    @player2 = Player.new('Player2', :o, @board)

    # assign the starting player
    @current_player = @player1
  end

  # play the game
  def play
    # looping /do while
    loop do
      # call the board renderer
      @board.render_board

      # ask for coordinates from the current player
      @current_player.coordinates_input

      # check if game is finished
      break if check_game_finished

      # switch players
      switch_players
    end
  end

  # switch_players
  def switch_players
    @current_player = if @current_player == @player1
                        @player2
                      else
                        @player1
                      end
  end

  # check_if game has finished
  def check_game_finished
    # check for winning condition or check for draw
    check_winner || check_draw
  end

  # check_winner?
  def check_winner
    # if current player's piece positions has a winning_combination?
    if @board.winning_combination?(@current_player.piece)
      puts "#{@current_player.name} wins the game, congratulations !"
      true
    else
      false
    end
  end

  # check_draw?
  def check_draw
    # if board filled up without winning combination
    if @board.full?
      puts "It's a draw, try again !"
      true
    else
      false
    end
  end
end
