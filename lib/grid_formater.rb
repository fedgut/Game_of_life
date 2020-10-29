class GridFormater
  def initialize(board)
    @board = board
  end

  def print
    grid = @board.grid
    system 'clear'
    grid.each do |sub_array|
      sub_array.each do |cell|
        print cell.alive ? '■' : '·'
        print ' '
      end
      print "\n"
    end
  end
end
