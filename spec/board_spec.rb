require './lib/board'

RSpec.describe Board do
  board = Board.new([
                      [1, 1, 0, 0],
                      [0, 0, 1, 1],
                      [0, 0, 0, 0],
                      [0, 1, 1, 1]
                    ])
  it 'Should generate an instance of the board class' do
    expect
  end
end