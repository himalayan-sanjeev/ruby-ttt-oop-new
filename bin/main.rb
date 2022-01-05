# frozen_string_literal: true

require_relative '../lib/game'

puts '##################################################'
puts "      Welcome to the Game of Tic Tac Toe!\n"
puts '##################################################'
puts "[ Select an Empty field co-ordinate from [(0,0),(0,1),(0,2),(1,0),(1,1),(1,2),(2,0),(2,1), 2,2]\n "

t = Game.new
t.play
