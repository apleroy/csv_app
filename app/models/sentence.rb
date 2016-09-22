class Sentence < ActiveRecord::Base

  validates :input, presence: true, length: { maximum: 1000 }

  ONLY_REPEATS = "all characters in this string repeat at some point"

  def first_non_repeating_character

    chars_array = self.input.strip.split("") # trim all whitespace and split remaining into char array
    chars_count_dictionary = Hash.new(0) # initialize the default value of the hash to be 0

    chars_array.each do |char|
      chars_count_dictionary[char] += 1 # increment count (default is zero when hash initialized)
    end

    chars_count_dictionary.each do |char, count|
      if count == 1
        return char
      end
    end

    return ONLY_REPEATS

    # ruby 2.3 is used in this project to preserve hash insert order
    # we could also iterate through the initial array and compare
    # against the hash to ensure preserved insertion order

    # chars_array.each do |char|
    #   if chars_count_dictionary[char] == 1
    #     return char
    #   end
    # end
    #
    # return ONLY_REPEATS

  end


end
