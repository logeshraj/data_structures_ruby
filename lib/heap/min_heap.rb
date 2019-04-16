class MinHeap
  attr_accessor :heap_size, :array

  def initialize
    @heap_size = 0
    @array = []
  end

  def peek
    @array[0] unless @array.empty?
  end

  def insert(element)
    @array.push element
    extract_min
    @heap_size+=1
  end

  def pop
    return if @array.empty?
    min = @array[0]
    @array[0] = @array.last
    @array.delete_at @array.length-1
    bubble_down
    @heap_size -=1
    min
  end

  def extract_min
    index = @array.length-1
    while index > 0 && @array[parent_of(index)] > @array[index]
      binding.irb
      parent = parent_of(index)
      swap index, parent
      index = parent
    end
  end

  def swap(a, b)
    temp = @array[a]
    @array[a] = @array[b]
    @array[b] = temp
  end

  def left_child index
    @array[left_child_index(index)]
  end

  def right_child index
    @array[right_child_index(index)]
  end

  def parent_of index
    if index%2 == 1
      (index-1)/2
    else
      (index-2)/2
    end
  end

  def left_child_index index
    index*2+1
  end

  def right_child_index index
    index*2+2
  end

  def leaf_node? index
    index >= @heap_size/2
  end

  def bubble_down
    index = 0
    while !left_child(index).nil?
      smaller_child_index = left_child_index(index)
      smaller_child_index = right_child_index(index) if !right_child(index).nil? && right_child(index) < left_child(index)
      if @array[index] > @array[smaller_child_index]
        swap(smaller_child_index, index)
      else
        break
      end
      index = smaller_child_index
    end
  end
end
