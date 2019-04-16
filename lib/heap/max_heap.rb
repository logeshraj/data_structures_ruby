class MaxHeap
  attr_accessor :heap_size, :array

  def initialize
    self.heap_size = 0
    self.array = []
  end

  def insert
  end

  def delete
  end

  def extract_max
  end

  def left_child(index)
    array[left_child_index(index)]
  end

  def right_child(index)
    array[right_child_index(index)]
  end

  def left_child_index(index) 
    2*index+1
  end

  def right_child_index(index)
    2*index+2
  end

  def leaf_node?(index)
    index >= self.heap_size/2
  end

  def valid_heap?(index)
    @array[index] >= left_child(index) && @array[index] >= right_child(index)
  end

end