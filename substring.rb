def substrings(string, dictionary)
	frequency_hash = Hash.new() # create hash that contains final return value
  dictionary.each do |substring| # for each word in dictionary, do:
    # its important to keep case insensitivity, so we assign downcase versions of both string and substring so we use 
    # these ones, instead of modifying the original strings or converting every time the original string to downcase
    down_string = string.downcase
    down_substring = substring.downcase

    # we have to fill the hash with "word" => number_of_appearances key/value pairs so:
		# if string includes substring, then frequency_hash[substring] = number_of_appearances_of_substring_inside_string
		frequency_hash[down_substring] = down_string.gsub(down_substring).count if down_string.include?(down_substring)
	end

  # we call the recently populated hash for the function to return it
	frequency_hash
end

string = "Howdy partner, sit down! How's it going?"
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings(string, dictionary)