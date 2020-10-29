require './lib/board'
require './lib/cell'

# The IOManager class is responsible for...
class IOManager
  # handling input and output
  def initialize
    @seed = ''
    @board = ''
  end

  def greeetings
    greeting = 'Hello dear player! Please give me a seed!'
    explanation = 'The seed must be a string representing a square bidimentional array of 0s and 1s'
    explanation1 = 'For example, for a 3x3 seed, "001 110 101"'
    sugestion = 'You can use some examples from the README!'

    puts greeting
    puts explanation
    puts explanation1
    puts sugestion
  end


end