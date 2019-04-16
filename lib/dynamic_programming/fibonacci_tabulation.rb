class Fibo
  @lookup = {}
  def self.fibonacci(number)
    @lookup[0] = 0
    @lookup[1] = 1
    (number-1).times do |num|
      i = num+2
      @lookup[i] = @lookup[num] + @lookup[num+1]
      puts @lookup
    end
    return @lookup[number]
  end
end

Fibo.fibonacci(9)