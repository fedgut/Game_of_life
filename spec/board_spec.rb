require './lib/board'

RSpec.describe Board do
  seed = [
    [1, 1, 0, 0],
    [0, 0, 1, 1],
    [0, 0, 0, 0],
    [0, 1, 1, 1]
  ]

  board = Board.new(seed)

  it 'Should generate an instance of the board class' do
    expect(board).to be_an_instance_of(Board)
  end

  context 'Should generate an array of cells from the seed' do

    it 'Gridd should be an array of the same lenght as the seed' do
      expect(board.grid).to be_an_instance_of(Array)
      expect(board.grid.length).to eq(seed.length)
      expect(board.grid[0].length).to eq(seed[0].length)
    end

    it 'Should be populated by cells' do
      expect(board.each).to be_an_instance_of(Cell)
    end
  end
end
