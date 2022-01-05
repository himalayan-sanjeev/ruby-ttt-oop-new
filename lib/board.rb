# frozen_string_literal: true

# game board features
class Board
  # initialize board
  def initialize
    # set up blank data structure
    @board = Array.new(3) { Array.new(3) }
  end

  # rendering the game board
  def render_board
    puts
    # loop through data structure
    @board.each do |row|
      row.each do |cell|
        # display an existing marker if any, else blank
        cell.nil? ? print('-') : print(cell.to_s)
      end
      puts
    end
    puts
  end

  # add_piece to the selected coordinate
  def add_piece(coords, piece)
    if piece_location_valid?(coords)
      # place the piece
      @board[coords[0]][coords[1]] = piece
      true
    else
      false
    end
  end

  # check if piece_location_valid
  def piece_location_valid?(coords)
    within_valid_coordinates?(coords)
  end

  # check if within_valid_coordinates
  def within_valid_coordinates?(coords)
    # coordinates range
    if (0..2).include?(coords[0]) && (0..2).include?(coords[1])
      true
    else
      puts 'Coordinates are out of bounds'
    end
  end

  # check if coordinates_available unoccupied
  def coordinates_available?(coords)
    # unoccupied coordinates
    if @board[coords[0]][coords[1]].nil?
      true
    else
      puts 'The field is already filled!'
    end
  end

  # winning_combination?
  def winning_combination?(piece)
    # is there a winning_diagonal? or winning_vertical? or winning_horizontal?
    winning_diagonal?(piece) || winning_horizontal?(piece) || winning_vertical?(piece)
  end

  # winning_diagonal?
  def winning_diagonal?(piece)
    # check if specified piece has a triplet across diagonals
    diagonals.any? do |d|
      d.all? { |cell| cell == piece }
    end
  end

  # winning_vertical?
  def winning_vertical?(piece)
    # check if specified piece has a triplet across verticals
    verticals.any? do |v|
      v.all? { |cell| cell == piece }
    end
  end

  # winning_horizontal?
  def winning_horizontal?(piece)
    # check if specified piece has a triplet across horizontals
    horizontals.any? do |h|
      h.all? { |cell| cell == piece }
    end
  end

  # diagonals
  def diagonals
    # return the diagonal pieces
    [[@board[0][0], @board[1][1], @board[2][2]], [@board[2][0], @board[1][1], @board[0][2]]]
  end

  # verticals
  def verticals
    # return the vertical pieces
    verticals = []
    3.times do |i|
      verticals << [@board[i][0], @board[i][1], @board[i][2]]
    end
    verticals
  end

  # horizontals
  def horizontals
    # return the horizontal pieces
    horizontals = []
    3.times do |i|
      horizontals << [@board[0][i], @board[1][i], @board[2][i]]
    end
    horizontals
  end

  # full?
  def full?
    # does every square contain a piece?
    @board.all? do |row|
      row.none?(&:nil?)
    end
  end
end
