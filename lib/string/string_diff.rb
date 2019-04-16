def one_diff?(str1, str2)
	return one_replace?(str1, str2) if str1.length == str2.length
	return one_insert?(str1, str2) if str1.length < str2.length
	one_insert?(str2, str1)
end


def one_replace?(str1, str2)
	diff_count = 0
	str1.length.times do |index|
		diff_count += 1 if str1[index] != str2[index]
	end
	diff_count == 1
end

def one_insert?(str1, str2)
	index1 = 0
	index2 = 0
	diff_count = 0
	while(index1 < str1.length && index2 < str2.length)
		# binding.irb
		if str1[index1] != str2[index2]
			index2 += 1
			diff_count += 1
			return false if diff_count > 1
		else
			index1+=1
			index2+=1
		end
	end
	return false if index1 < str1.length-1 || index2 < str2.length-1
	true
end


puts one_diff?('apple', 'bpple')
puts one_diff?('aple', 'apple')
puts one_diff?('apple', 'aple')
puts one_diff?('apple', 'bple')
puts one_diff?('apple', 'bbple')
puts one_diff?('apple', 'ple')
puts one_diff?('ple', 'apple')
