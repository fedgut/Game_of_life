class Cell
  attr_reader :neighbours, :alive

  def initialize(alive = false)
    @alive = alive
    @neighbours = {
      north: [-1, 0], north_east: [-1, 1],
      east: [0, 1], south_east: [1, 1],
      south: [1, 0], south_west: [1, -1],
      west: [0, -1], north_west: [-1, -1]
    }
    @next_status = false
  end

  def dies
    @next_status = false
  end

  def lives
    @next_status = true
  end

  def set_generation
    @alive = @next_status
  end
end
