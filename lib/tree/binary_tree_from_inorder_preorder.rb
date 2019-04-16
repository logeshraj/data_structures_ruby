def build_tree(preorder, inorder)
  build(preorder, inorder, 0, inorder.length - 1)
end

def build(preorder, inorder, instart, inend)
  byebug
  return if instart > inend
  head_val = preorder[@preIndex]
  return unless head_val
  @preIndex+=1
  bt = TreeNode.new(head_val) 
  return bt if instart == inend
  inorder_index = inorder.index(head_val)
  return unless inorder_index
  left = build(preorder, inorder, instart, inorder_index - 1)
  bt.left = left if left
  right = build(preorder, inorder, inorder_index + 1, inend) 
  bt.right = right if right
  bt
end


class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    self.value = value
  end
end


  #      3

  #   9     20

  # 10 12  15  7

  # inorder - [10, 9, 12, 3, 15, 20, 7]
  # preorder - [3, 9, 10, 12, 20, 15, 7]
@preIndex = 0
bt = build_tree([3, 9, 10, 12, 20, 15, 7], [10, 9, 12, 3, 15, 20, 7])
# bt = build_tree([3,9,20,15,7],[9,3,15,20,7])
# bt = build_tree([1,2], [1,2])

# bt = build_tree([1,2,3], [3,2,1])
binding.irb