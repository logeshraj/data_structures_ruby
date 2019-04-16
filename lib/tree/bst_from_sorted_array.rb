def sorted_array_to_bst(nums)
  return [] if nums.nil? || nums.empty?
  build_tree(nums, 0, nums.length - 1)
end


def build_tree(nums, start_pos, end_pos)
  return if start_pos > end_pos
  mid = (start_pos + end_pos)/2
  bt = TreeNode.new(nums[mid])
  bt.left = build_tree(nums, start_pos, mid - 1)
  bt.right = build_tree(nums, mid + 1, end_pos)
end

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
      @val = val
      @left, @right = nil, nil
  end
end