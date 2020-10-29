require './lib/io_manager'

RSpec.describe IOManager do
  manager = IOManager.new
  square_array = [[0, 0, 1], [1, 1, 0], [1, 0, 1]]
  invalid_array = [[0, 0, 1], [1, 1, 0]]
  describe 'validate_array_square' do
    it 'Should be true if array is an square' do
      expect(manager.validate_array_square(square_array)).to be(true)
    end
    it 'Should be false if array is not square' do
      expect(manager.validate_array_square(invalid_array)).to be(false)
    end
  end
end
