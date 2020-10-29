require './lib/board'
require './lib/cell'

# The SeedManager class is responsible for...
class SeedManager
  # requesting valid input
  attr_reader :parsed_array
  def initialize
    @seed = ''
    @parsed_array = ''
  end

  def greeetings
    greeting = '   Hello dear player! Please give me a seed!'
    explanation = '   The seed must be a string representing a square bidimentional array of 0s and 1s'
    explanation1 = '   For example, for a 3x3 seed, "001 110 101"'
    sugestion = '   You can use some examples from the README!'

    puts greeting
    puts explanation
    puts explanation1
    puts sugestion
  end

  def request_seed
    @seed = gets.chomp
  end

  def seed_is_valid?
    regex = Regexp.new(/^[0-1]{1,}$/)
    seed.match?(regex)
  end

  def parse_seed
    array_of_strings = @seed.split(' ')
    @parsed_array = array_of_strings.map { |sub_arr| p sub_arr.split('') }
  rescue StandardError => e
    puts e.message
    puts "\n Invalid Input, please try again"
    request_seed
    retry
  end

  def arr_is_valid?
    @parsed_array.all? do |sub_array|
      sub_array.length == @parsed_array.length
    end
  end
end
