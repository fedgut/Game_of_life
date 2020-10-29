require './board'
require './grid_formater'
require './seed_manager'

class Game
  def initialize
    @seed_manager = SeedManager.new
    @board = ''
    @grid_formater = ''
    @turn = 0
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

  def obtain_input
    @seed_manager.request_seed
    @seed_manager.parse_seed
    return if @seed_manager.validate

    obtain_input
  end

end
