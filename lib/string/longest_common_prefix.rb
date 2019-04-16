def longest_common_prefix(strs)
  i = 0 
  continue = true
  result = ""
  while(continue)    
    char = nil
    break if strs.empty?
    if strs.length == 1
      binding.irb
      result = strs[0]
      break
    end
    char = strs[0][i] if strs[0].length-1 > i
    strs.each do |str|
      if (char && str[i] != char || !char)
        continue = false 
        break
      end
    end
    result += char if char && continue
    i+=1
  end
  result
end


# puts longest_common_prefix(["flower","flow","flight"])
# puts longest_common_prefix(["dog","racecar","car"])
# puts longest_common_prefix([""])
puts longest_common_prefix(["a"])