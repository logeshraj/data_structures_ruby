def group_anagrams(strs)
  string_hash = {}
  strs.each do |str|
    sorted = str.chars.sort.join
    string_hash[sorted] ? string_hash[sorted] << str : string_hash[sorted] = [str]
  end
  string_hash.values
end

print group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"])