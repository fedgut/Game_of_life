require './lib/cell'

RSpec.describe Cell do
  cell = Cell.new(1)
  it 'Should generate an instance of the cell class' do
    expect(cell).to be_an_instance_of(Cell)
  end
  it 'Should expose the alive propery' do
    expect(cell.alive).to be(true)
  end
  it 'Should expose neighbours ' do
    expect(cell.neighbours).to eq({
                                    north: [-1, 0], north_east: [-1, 1],
                                    east: [0, 1], south_east: [1, 1],
                                    south: [1, 0], south_west: [1, -1],
                                    west: [0, -1], north_west: [-1, -1]
                                  })
  end
  it 'Should handle death status without changing current alive status' do
    cell.dies
    expect(cell.alive).to be(true)
  end
  it 'Should change the next generations status without affecting current generation' do
    cell.set_generation
    expect(cell.alive).to be(false)
    cell.lives
    expect(cell.alive).to be(false)
    cell.set_generation
    expect(cell.alive).to be(true)
  end
end
