def str_str(haystack, needle)
  return 0 if needle.nil? || needle.empty?
  return -1 if haystack.nil? || haystack.empty?
  i = 0 
  while(i < haystack.length)
    return -1 if needle.length + i > haystack.length
    start_index = i
    j = 0
    while(j < needle.length)
      if haystack[start_index] == needle[j]
        return i if j == needle.length - 1
        start_index+=1
      else
        break
      end
      j += 1
    end
    i += 1
  end
  -1
end