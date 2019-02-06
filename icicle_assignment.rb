



$hash_map = {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],"6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}



$dictionary = []

File.open('/home/vishnu/Downloads/dictionary.txt', "r") do |f|
	f.each_line do |line|
		$dictionary.push(line.chomp.downcase)
	end
end


$final_data = []

def output(digits, level = 1)
	combination = []
	words_with_exact_match = []
	length = digits.length
	for i in 2..(length - 1) do
		string = digits[0..i] 
		next if string.length != 0 && string.length < 3
		remaining = digits[(i+1)..(length - 1)]
		array = []
		for j in 0..(string.length - 1) do
			array << $hash_map[string[j]]
		end
		values = [""].product(*array).map(&:join)

		words_with_exact_match = values.select { |k| $dictionary.bsearch { |p| k <=> p }}
		next if remaining.length != 0 && remaining.length < 3
		if remaining.length == 0
			result = words_with_exact_match
			combination += result
		else
			result = output(remaining, 2)
			combination += words_with_exact_match.product(result).map(&:flatten)
		end
	end

	if level == 1
		$final_data += combination
	end

	combination
end

