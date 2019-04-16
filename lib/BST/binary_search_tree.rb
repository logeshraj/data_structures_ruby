class BSTNode
  attr_accessor :value, :left, :right

  def initialize(value)
    self.value = value
  end
end

class BinarySearchTree
  attr_accessor :head

  MAX = 999999999999999999
  MIN = -999999999999999999

  def add(value, root = self.head)
    puts value
    unless root
      node = BSTNode.new(value)
      self.head = node unless head
      return node
    end

    if value <= root.value
      return root.left = add(value, root.left) if root.left.nil?
      add(value, root.left)
    else
      return root.right = add(value, root.right) if root.right.nil?
      add(value, root.right)
    end
  end

  def find(value, root = self.head)
    puts root.value if root.value
    return root if root.value == value

    if(value < root.value )
      find(value, root.left)
    else
      find(value, root.right)
    end
  end

  def balance
  end

  def inorder(node = self.head)
    inorder(node.left) if node.left
    puts node.value if node && node.value
    inorder(node.right) if node.right
  end

  def preorder(node = self.head)
    puts node.value if node && node.value
    preorder(node.left) if node.left
    preorder(node.right) if node.right
  end

  def postorder(node = self.head)
    postorder(node.left) if node.left
    postorder(node.right) if node.right
    puts node.value if node && node.value
  end

  def valid?(root = self.head, min_key = MIN, max_key = MAX)
    return true if root.nil?
    return false if root.value <= min_key || root.value >= max_key
    valid?(root.left, min_key, root.value) && valid?(root.right, root.value, max_key)
  end
end

bst = BinarySearchTree.new

bst.add(1)
bst.head.right = BSTNode.new(1)
# bst.add(10)
# bst.add(2)
# bst.add(3)
# bst.add(7)
# bst.add(6)
# bst.add(8)
# bst.add(9)
puts ""
# bst.find(2)
# bst.inorder

# puts ""

# bst.preorder
# puts ""

# bst.postorder

# puts bst.valid?

# three = bst.head.left.left.right

# three.value = 6
# puts ""
# bst.inorder
puts bst.valid?