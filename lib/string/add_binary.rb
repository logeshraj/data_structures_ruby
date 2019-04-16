def add_binary(a, b)
  i = a.length - 1
  j = b.length - 1
  result = ''
  sum = 0 
  while(i >= 0 || j >= 0 || sum == 1) 
    sum += i>=0 ? a[i].ord - 48 : 0
    sum += j>=0 ? b[j].ord - 48 : 0
    result = (sum%2).to_s+result
    sum /= 2
    i -= 1
    j -= 1
  end
  result
end

p add_binary('11','1')