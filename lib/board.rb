require './lib/cell'

class Board
  attr_reader :grid
  def initialize(seed)
    @seed = seed
    @grid = []
  end

  def populate_grid
    @seed.each do |sub_array|
      inner_array = sub_array.map do |item|
        Cell.new(item)
      end
      @grid.push(inner_array)
    end
  end
end
