def reverse_words(s)
  s.strip!
  i = s.length - 1
  result = ''
  parent_stack = []
  while(i >= 0)
    stack = []
    while(s[i] != ' ' && i >=0)
      stack << s[i]
      i -= 1
    end
    parent_stack << stack unless stack.empty?
    i -= 1
  end
  binding.irb
  parent_stack.each do |word|
    while(letter = word.pop)
      result << letter
    end
    result << ' '
  end
  result.strip!
end

p reverse_words("a good   example")