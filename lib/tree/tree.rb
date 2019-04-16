class Node
  attr_accessor :value, :children

  def initialize(value)
    self.value = value
    self.children =  []
  end

  def add_children(child)
    children.push child
  end

end


class Tree
  attr_accessor :head
  def traverse(node = head)
    puts node.value
    node.children.each do |child|
        traverse(child)
    end
  end

  def traverse_sum(node = head)
    return node.value if node.children.empty?
    node.value + node.children.collect { |child| traverse_sum(child) }.max 
  end
end


node1 = Node.new(4)
node2 = Node.new(5)

node3 = Node.new(1)
node3.add_children(node1)
node3.add_children(node2)

node4 = Node.new(3)

node5 = Node.new(2)
node5.add_children(node3)
node5.add_children(node4)

node6 = Node.new(9)
node7 = Node.new(8)
node8 = Node.new(9)
node8.add_children(node6)
node8.add_children(node7)

node9 = Node.new(1)
node9.add_children(node8)

node10 = Node.new(1)
node11 = Node.new(5)
node12 = Node.new(3)

node13 = Node.new(10)
node13.add_children(node10)
node13.add_children(node11)
node13.add_children(node12)


node14 = Node.new(3)
node14.add_children(node5)
node14.add_children(node9)
node14.add_children(node13)



tree = Tree.new
tree.head = node14
puts tree.traverse
puts tree.traverse_sum