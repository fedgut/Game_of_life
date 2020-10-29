require './lib/board'
require './lib/cell'

RSpec.describe Board do
  seed = [
    [1, 1, 0, 0],
    [0, 0, 1, 1],
    [0, 0, 0, 0],
    [0, 1, 1, 1]
  ]

  small_seed = [
    [1, 0, 0],
    [0, 1, 1],
    [0, 0, 1],
  ]

  board = Board.new(seed)

  it 'Should generate an instance of the board class' do
    expect(board).to be_an_instance_of(Board)
  end

  context 'Should generate an array of cells from the seed' do
    board.populate_grid
    it 'Grid should be an array of the same lenght as the seed' do
      expect(board.grid).to be_an_instance_of(Array)
      expect(board.grid.length).to eq(seed.length)
      expect(board.grid[0].length).to eq(seed[0].length)
    end

    it 'Should be populated by arrays of cells' do
      expect(board.grid.all? { |sub_array| sub_array.class == Array }).to be(true)
      expect(board.grid.all? do |sub_array|
        sub_array.all? { |cell| cell.class == Cell }
      end).to be(true)
    end

    it 'Should correctly generate assign live or death' do
      expect(board.grid[0][0].alive).to be(true)
      expect(board.grid[1][1].alive).to be(false)
      expect(board.grid[2][2].alive).to be(false)
      expect(board.grid[3][3].alive).to be(true)
    end
  end

  context 'Should count the living neighbours of each cell' do
    board1 = Board.new(small_seed)
    board1.populate_grid
    board1.set_living_neighbours

    it 'Should correctly set the number' do
      expect(board1.grid[0][0].living_neighbours).to eq(1)
      expect(board1.grid[0][2].living_neighbours).to eq(2)
      expect(board1.grid[1][1].living_neighbours).to eq(3)
    end
  end
end
