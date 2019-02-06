



$hash_map = {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],"6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}



$dictionary = []
file_path = "/home/vishnu/Downloads/dictionary.txt" #path of dictionary file needs to be specified
File.open(file_path, "r") do |f|
	f.each_line do |line|
		$dictionary.push(line.chomp.downcase)
	end
end


$final_data = []

#The algorithm: We are using recursion in a for loop. we are iterating from 3 digits to the length of digits. When it is 3 digits, it will call recursively with the remaining digits. We are splitting the phone number into string(first 3 digits say 'X') and remaining(remaining digits). We store matching words from dictionary mapped to X. If matches present, go recursive for remaining digits else go to next.

#Ex: 6686787825 output(6686787825)
#step-1: string=668 - call output(6787825)=>(call(7825)=>call(5))
#if the digits length is less than 3 and if it is not zero, then we should go to next
#so next in the before loop is
def output(digits)
	combination = []
	digits = digits.to_s
	words_with_exact_match = []
	length = digits.length
	for i in 2..(length - 1) do
		#we are starting the loop from 2 because the minimum number of characters in words should be 3
		string = digits[0..i]
		next if string.length != 0 && string.length < 3
		remaining = digits[(i+1)..(length - 1)]
		array = []
		#we are collecting the mapping of phone numbers to strings
		for j in 0..(string.length - 1) do
			array << $hash_map[string[j]]
		end
		#product of all keys
		values = [""].product(*array).map(&:join)

		#Using binary search to find the strings that match exactly
		words_with_exact_match = values.select { |k| $dictionary.bsearch { |p| k <=> p }}
		next if remaining.length != 0 && remaining.length < 3
		#combination variable stores all matches for particular recursive call
		if remaining.length == 0
			result = words_with_exact_match
			combination += result
		else
			result = output(remaining)
			combination += words_with_exact_match.product(result).map(&:flatten)
		end
	end

	combination
end

