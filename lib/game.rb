require './board'
require './cell'

class Game
  def initialize
    @seed = null
    @board = null
  end

  def greeetings
    greeting = 'Hello dear player! Please give me a seed!'
    explanation = 'The seed must be a string representing a square bidimentional array of 0s and 1s'
    explanation1 = 'For example, for a 3x3 seed, "001 110 101"'
    sugestion = 'You can use some examples from the README!'

    puts greeting
    puts explanation
    puts explanation1
    puts sugestion
  end

  def seed
    @seed = gets.chomp
  end

  def validate_array_square(array)
    return false unless array.all? do |sub_array|
      sub_array.length == array.length
    end

    true
  end

  def parse_seed
    begin
      array_of_strings = @seed.split(' ')
      array_of_arrays = array_of_strings.split('')
      validate_array_square(array_of_strings)
    rescue StandardError => e
      puts e.message
      puts 'Invalid Input, please try again'
      seed
      retry
    end
    array_of_arrays
  end

  def start
    greeetings
    seed
    parse_seed
    @board = Board.new(@seed)
  end
end
