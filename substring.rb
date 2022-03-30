def substrings(string, dictionary)
	frequency_hash = Hash.new()
  dictionary.each do |substring|
    down_string = string.downcase
    down_substring = substring.downcase
		frequency_hash[down_substring] = down_string.gsub(down_substring).count if down_string.include?(down_substring)
	end
	frequency_hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)