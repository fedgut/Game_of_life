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
end
