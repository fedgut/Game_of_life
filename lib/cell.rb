class Cell
  attr_accessor :living_neighbours
  attr_reader :neighbours, :alive

  def initialize(num)
    @alive = num.positive? ? true : false
    @neighbours = {
      north: [-1, 0], north_east: [-1, 1],
      east: [0, 1], south_east: [1, 1],
      south: [1, 0], south_west: [1, -1],
      west: [0, -1], north_west: [-1, -1]
    }
    @next_status = false
    @living_neighbours = 0
  end

  def dies
    @next_status = false
  end

  def survives
    @next_status = true if @alive
  end

  def lives
    @next_status = true
  end

  def calculate_next_generation
    dies if living_neighbours < 2 || living_neighbours > 3
    survives if living_neighbours == 2
    lives if living_neighbours == 3
  end

  def set_generation
    @alive = @next_status
    @living_neighbours = 0
  end
end
