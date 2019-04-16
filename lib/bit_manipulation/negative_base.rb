def solution(a, b)
  x = int_value(a)
  puts x
  y = int_value(b)
  puts y
  z = x+y
  puts z
  negative_base2(z)
end

def int_value(array)
  return 0 if array.length == 0
  i = 1
  sum = 0
  sum +=  array[0]
  while(i < array.length)
    add = (-2 ** i) * array[i] 
    to_add = i.odd? ? add : -1 * add
    sum += to_add
    i += 1
  end
  sum
end

def negative_base2(value)
  result = []
  while(value != 0)
    remainder = value % -2
    value = value / -2
    if remainder < 0
      remainder *= -1
      value += 1
    end
    result << remainder
  end
  result
end

# p solution([0,1,1,0,0,1,0,1,1,1,0,1,0,1,1], [0,0,1,0,0,1,1,1,1,1,0,1])

# p negative_base2(100)
# p negative_base2(-100)

p int_value([0, 0, 0, 1, 0, 0, 1, 0, 1, 1])

p int_value([0, 0, 0, 1, 1, 0, 1, 1, 1])