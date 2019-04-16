def plus_one(digits)
  return [1] if digits.nil? || digits.empty?
  i = digits.length - 1
  carry = 1
  while(i >= 0)
    sum = carry + digits[i]
    digit = sum % 10
    carry = sum / 10
    digits[i] = digit
    i -=1
  end
  digits.unshift carry if carry > 0
  digits
end

print plus_one([1,2,3])
puts ""
print plus_one([])
puts ""
print plus_one([1])
puts ""
print plus_one([9])
puts ""
print plus_one([7,9])
puts ""
print plus_one([9,9,9])
puts ""