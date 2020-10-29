require './lib/board'
require './lib/grid_formater'
require './lib/seed_manager'

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
    @seed_manager.validate
  end

  def create_board
    @board = Board.new(@seed_manager.parsed_array)
    @board.populate_grid
  end

  def create_grid_formater
    @grid_formater = GridFormater.new(@board.grid)
  end

  def turn
    @grid_formater.show
    @board.calculate_next_gen
    @board.set_next_gen
    turn
  end

  def boot
    greeetings
    obtain_input
    create_board
    create_grid_formater
    'Starting'
  end
end
