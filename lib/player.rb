# frozen_string_literal: true

# all the player features
class Player
  attr_accessor :name, :piece

  # initialize
  def initialize(name, piece, board)
    @name = name
    @piece = piece
    @board = board
  end

  # coordinates_input
  def coordinates_input
    # looping for asking coordinates
    loop do
      # ask_for_coordinates
      coords = ask_for_coordinates
      # if validate_coordinates_format is true
      break if validate_coordinates_format(coords) && @board.add_piece(coords, @piece)
    end
  end

  # ask_for_coordinates
  def ask_for_coordinates
    puts "Turn: #{@name}, (with symbol:#{@piece}), enter your coordinates in the form x,y:"
    # pull coordinates from command line
    gets.strip.split(',').map(&:to_i)
  end

  # validate_coordinates_format
  def validate_coordinates_format(coords)
    if coords.is_a?(Array) && coords.size == 2
      true
    else
      puts 'Your coordinates format is not valid!'
    end
  end
end
