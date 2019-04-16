class Node
  attr_accessor :value, :children

  def initialize(value)
    self.value = value
  end

  def add_children(child)
    children.push child
  end

end