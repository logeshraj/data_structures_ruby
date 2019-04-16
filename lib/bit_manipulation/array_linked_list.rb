def solution(a)
  return 0 if a.length == 0 
  index = 0
  count = 0
  while(index != -1)
    count += 1
    index = a[index]
  end
  count
end