class Interval
    attr_accessor :start, :end
    def initialize(s=0, e=0)
        @start = s
        @end = e
    end
end

def insert(array, interval)
  return [interval] if array.nil? || array.empty?
  if array.first.start > interval.start
    array.insert(0, interval)
  elsif array.last.start < interval.start
    array.insert(array.length, interval)
  else
    i = 0
    while(i < array.length)
      current = array[i]
      next_ele = array[i+1]
      if current.start < interval.start && next_ele.start > interval.start
        array.insert(i+1, interval)
        break
      end
      i+=1
    end
  end
  merge_interval(array)
end

def merge_interval(array)
  return if array.nil? || array.empty?
  array = array.sort{ |a,b| a.start <=> b.start } if array.length > 1
  length = array.length
  stack = []
  i = 0
  while(i < length)
    top = stack.last
    current = array[i]
    if top.nil? ||  top.end < current.start
      stack << current
    elsif top.end < current.end
      top.end = current.end
    end
    i += 1
  end
  stack
end

# st = insert( [[1, 2], [3, 4], [5, 7]] , [4,6])
st = insert([Interval.new(1,5)], Interval.new(1,7))
p st