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

  def set_living_neighbours
    @grid.each_with_index do |sub_array, current_row|
      sub_array.each_with_index do |cell, current_col|
        cell.neighbours.each_value do |offset|
          # offset refers to the cells neighbours coordinates (North [1][1], south[-1][-1]...)
          next if (current_row + offset[0]).negative? ||
                  (current_row + offset[0]) >= grid.length
          next if (current_col + offset[1]).negative? ||
                  (current_col + offset[1]) >= grid[current_row].length

          cell.living_neighbours += 1 if grid[current_row + offset[0]][current_col + offset[1]].alive
        end
      end
    end
  end

  def calculate_next_gen
    set_living_neighbours
    @grid.each do |sub_array|
      sub_array.each(&:calculate_next_generation)
    end
    @grid.each do |sub_array|
      sub_array.each(&:set_generation)
    end
  end
end
