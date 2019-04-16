class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    self.value = value
  end
end


class BinaryTree
  attr_accessor :head, :max

  def initialize
    self.max = 0
  end

  def perfect_levels(root = self.head)
    return 0 if root.nil?
    max_so_far = 1
    if root.left || root.right
      left_level = perfect_levels(root.left)
      right_level = perfect_levels(root.right)
      if left_level == right_level
        max_so_far = 1 + left_level
      else
        binding.irb
        max_so_far = 1
        max_so_far = 2 if root.left && root.right
      end
    end
    self.max = max_so_far if max_so_far > self.max
    return self.max if root == self.head
    return max_so_far
  end

  def perfect_nodes
    n = perfect_levels
    return (2 ** n) - 1 if n
    0
  end
end

bt = BinaryTree.new
node1 = Node.new(1)
bt.head = node1
node2 = Node.new(2)

node4 = Node.new(4)

node3 = Node.new(3)

node5 = Node.new(5)
node6 = Node.new(6)
node7 = Node.new(7)
node8 = Node.new(8)
node9 = Node.new(9)
node10 = Node.new(10)

node11 = Node.new(11)
node12 = Node.new(12)
node13 = Node.new(13)
node14 = Node.new(14)
node15 = Node.new(15)
node16 = Node.new(16)
node17 = Node.new(17)
node18 = Node.new(18)

node1.left = node2

node2.right = node4

node1.right = node3

node3.left = node5

node5.left = node7

node5.right = node8

node3.right = node6
node6.left = node9
node6.right = node10

node10.left = node11
node10.right = node18

node2.left = node12
node12.left = node13
node12.right = node14
node4.left = node15
node4.right = node16
node15.left= node17


puts bt.perfect_nodes