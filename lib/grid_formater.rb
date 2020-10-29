class GridFormater
  def initialize(grid)
    @grid = grid
  end

  def show
    sleep 1
    system 'clear'
    @grid.each do |sub_array|
      sub_array.each do |cell|
        print cell.alive ? '■' : '·'
        print ' '
      end
      print "\n"
    end
  end
end
