# The SeedManager class is responsible for...
class SeedManager
  # requesting valid input
  attr_reader :parsed_array, :parsed_array_valid
  def initialize
    @seed = ''
    @parsed_array = ''
    @parsed_array_valid = false
  end

  def request_seed
    @seed = gets.chomp
  end

  def seed_is_valid?
    regex = Regexp.new(/^[0-1\s]{1,}$/)
    @seed.match?(regex)
  end

  def parse_seed
    @parsed_array = []
    array_of_arrays = @seed.split(' ')
    array_of_strings = array_of_arrays.map do |sub_arr|
      sub_arr.split('')
    end
    array_of_strings.each do |sub_arr|
      @parsed_array.push(sub_arr.map(&:to_i))
    end
  rescue StandardError => e
    puts e.message
    puts "\n Invalid Input, please try again"
  end

  def arr_is_valid?
    @parsed_array.all? do |sub_array|
      sub_array.length == @parsed_array.length
    end
  end

  def validate
    @parsed_array_valid = true if arr_is_valid? && seed_is_valid?
    puts "\n Please use valid input! (See README for help) \n" unless @parsed_array_valid
    puts "\n Valid input \n" if @parsed_array_valid
  end
end
