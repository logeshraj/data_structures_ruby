def generate_parenthesis(n)
  return [""] if n < 0
  @result = []
  backtrack('',0,0, n)
  @result
end


def backtrack(str, left, right, max)
	if str.length == 2*max
    @result << str
  else
    backtrack(str+'(', left+1, right, max) if left < max
    backtrack(str+')', left, right+1, max) if right < left
  end
end

print generate_parenthesis(0)
puts ""
print generate_parenthesis(1)
puts ""
print generate_parenthesis(2)
puts ""
print generate_parenthesis(3)
puts ""
print generate_parenthesis(4)
puts ""
print generate_parenthesis(-1)