def solution(a, b)
  num_a = a
  num_b = b
  result = ''
	while(num_a != 0 && num_b != 0)
    if num_a > num_b && result[result.length-1] != 'a'
      result += 'aab'
      num_a -= 2
      num_b -= 1
    elsif num_b > num_a && result[result.length-1] != 'b'
      result += 'bba'
      num_a -= 1
      num_b -= 2 
    else
      if result[result.length-1] == 'a'
        result += 'ba'
        num_a -= 1
        num_b -= 1
      else
        result += 'ab'
        num_a -= 1
        num_b -= 1
      end
    end
  end
  if num_a != 0
    result += 'a' * num_a
  else
    result += 'b' * num_b
  end
  result
end


p solution(5,3)
p solution(3,3)
p solution(1,4)
p solution(10,5)
p solution(10,7)
p solution(7,10)
p solution(0,1)
p solution(0,2)
p solution(1,0)
p solution(2,0)
p solution(3,1)
p solution(1,3)
p solution(70,40)
# 02
# bba