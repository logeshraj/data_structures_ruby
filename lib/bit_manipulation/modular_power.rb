def modular_power(x, y, m)
  if y = 0
    return 1
  elsif y%2 ==0
    res = modular_power(x, (y/2), m) 
    return res*res%m
  else
    return modular_power(x, 1, m) * modular_power(x, (y-1), m)
  end
end

modular_power(3,200,50)


def modular_power_bit(x, y, m)
  res = 1
  x = x % m
  while(y>0)
    res = (res * x) % m if y & 1 == 1
    y = y >> 1 
    x = (x * x) % m
  end
  res 
end

modular_power_bit(3,200,50)