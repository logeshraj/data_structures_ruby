def min_window(s, t)
  return '' if s.length.zero? || t.length.zero?
  dict_t = {}
  t.each_char do |char|
    dict_t[char] = (dict_t[char] || 0 ) + 1
  end
  required = dict_t.length
  l = 0 
  r = 0
  formed = 0
  window_counts = {}
  ans = [-1, 0, 0] 
  while(r < s.length)
    char = s[r]
    window_counts[char] = (window_counts[char] || 0) + 1
    formed +=1 if dict_t[char] && window_counts[char] == dict_t[char]
    while(l <= r && formed == required)
      char = s[l]
      if ans[0] == -1 || r - l + 1 < ans[0]
        ans[0] = r - l + 1
        ans[1] = l
        ans[2] = r
      end
      window_counts[char] = window_counts[char] - 1
      formed -= 1 if dict_t[char] && window_counts[char] < dict_t[char]
      l += 1
    end
    r += 1
  end
  ans[0] == -1 ? "" : s[ans[1]..ans[2]]
end

puts min_window("ADOBECODEBANC", "ABC")