# The SeedManager class is responsible for...
class SeedManager
  # requesting valid input
  attr_reader :parsed_array, :parsed_array_valid
  def initialize
    @seed = ''
    @parsed_array = ''
    @parsed_array_valid = ''
  end

  def request_seed
    @seed = gets.chomp
  end

  def seed_is_valid?
    regex = Regexp.new(/^[0-1]{1,}$/)
    seed.match?(regex)
  end

  def parse_seed
    array_of_strings = @seed.split(' ')
    @parsed_array = array_of_strings.map { |sub_arr| p sub_arr.split('') }
  rescue StandardError => e
    puts e.message
    puts "\n Invalid Input, please try again"
    request_seed
    retry
  end

  def arr_is_valid?
    @parsed_array.all? do |sub_array|
      sub_array.length == @parsed_array.length
    end
  end

  def validate
    @parsed_array_valid = true if arr_is_valid? && seed_is_valid?
    puts 'Please use valid input! (See README for help)' unless @parsed_array_valid
  end
end
