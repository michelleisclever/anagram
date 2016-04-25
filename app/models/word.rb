class Word < ActiveRecord::Base
    before_create :add_letters
    
    def add_letters
        characters = self.text.chars
          alphabetized_characters = characters.sort
        self.letters = alphabetized_characters.join
  end
    
    def self.find_anagrams(string)
        combinations = []
        
        # Convert word to an array of letters
        letters = string.split(//)
        
        # Create an array to store our anagrams
        anagrams = []
        
        # Loop through each letter in letters
        letters.each do |letter|
            # Select the remaining letters
            remaining = letters.select { |l| l != letter}
            
            # Create a new word by combining the letter + the remaining letters
            # Add new word to anagrams array
            anagrams << letter + remaining.join('')
            
            # Create a new word by combining the letter + the reverse of the remaining letters
            # Add a new word to anagrams array
            anagrams << letter + reverse_letters(remaining).join('')
        end
        
        #Return anagram array
        anagrams.each do |combo|
            if Word.find_by_text(combo).present?
                combinations << combo
            end
        end
         combinations
    end
        
    def self.reverse_letters(letters)
        # Create a new array of 2 items
        length = letters.length
        reversed_letters = Array.new(length)
        
        # Loop through letters and keep index
        letters.each_with_index do |letter, index|
            reversed_letters[length - index - 1] = letter
        end
        
        reversed_letters
    end

def self.three_letters?(input)
    #return true if input is 3 or less characters
    #and false otherwise
    if input.length == 3
        true
    else 
        false
    end
end

def self.distinct_letters?(input)
    letter_array = input.chars
    unique_letters = letter_array.uniq
    if unique_letters.length == letter_array.length
        true
    else
        false
    end
end

def self.valid_input?(input)
    if three_letters?(input) && distinct_letters?(input)
true
else
        raise Exception.new("Word must be less than or equal to 3 characters and only distinct letters.")
    end
end
    
end

