def substrings(string, dictionary)
	frequency_hash = Hash.new()
  dictionary.each do |substring|
		frequency_hash[substring] = string.downcase.gsub(substring).count if string.downcase.include?(substring)
	end
	frequency_hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)