class Fibo
  @lookup = {}
  def self.fibonacci(number)
    unless @lookup[number]
      if number <= 1 
        @lookup[number] = number
      else
        @lookup[number] = fibonacci(number-1) + fibonacci(number-2)
      end
    end
    return @lookup[number]
  end
end
puts Fibo.fibonacci(20)