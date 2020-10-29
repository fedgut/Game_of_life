require './lib/cell'
# The Board class is responsible of...
class Board
  # Handling the grid, passing information to the cell and receiving the cells state
  attr_reader :grid
  def initialize(seed)
    @seed = seed
    @grid = []
  end

  def populate_grid
    @seed.each do |sub_array|
      inner_array = sub_array.map do |number|
        Cell.new(number)
      end
      @grid.push(inner_array)
    end
  end

  def set_living_neighbours
    @grid.each_with_index do |sub_array, current_row|
      sub_array.each_with_index do |cell, current_col|
        cell.neighbours.each_value do |offset|
          # offset represents the cells neighbours coordinates (North [1][1], south[-1][-1]...)
          row_offset = current_row + offset[0]
          column_offset = current_col + offset[1]
          next if row_offset.negative? ||
                  row_offset >= grid.length
          next if column_offset.negative? ||
                  column_offset >= grid[current_row].length

          cell.living_neighbours += 1 if grid[row_offset][column_offset].alive
        end
      end
    end
  end

  def calculate_next_gen
    set_living_neighbours
    @grid.each do |sub_array|
      sub_array.each(&:calculate_next_generation)
    end
  end

  def set_next_gen
    @grid.each do |sub_array|
      sub_array.each(&:set_generation)
    end
  end
end
