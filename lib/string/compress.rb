def compress(str)
	compressed  = ""
	repeat_count = 0
	index = 0
	while (index < str.length)
		current_char = str[index]
		index += 1
		while(current_char == str[index])
			index += 1
			repeat_count += 1
		end
		compressed = compressed+"#{current_char}#{repeat_count+1}"
		repeat_count = 0
	end
	str.length <= compressed.length ? str : compressed	
end

puts compress("aaaabbc")

puts compress("abc")