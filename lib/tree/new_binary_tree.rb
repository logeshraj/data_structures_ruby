class BinaryTree
	attr_accessor :value, :left, :right, :last_level, :horizontal_distance

  def initialize(value)
    self.value = value
  end

  def print_inorder
    left.print_inorder if left
    print "#{value} "
    right.print_inorder if right
  end

  def print_preorder
    print "#{value} "
    left.print_preorder if left
    right.print_preorder if right
  end


  def print_postorder
    left.print_postorder if left
    right.print_postorder if right
    print "#{value} "
  end

  def print_right
    return unless self.value || self.left || self.right
    arr = []
    result = []
    arr << self
    while(!arr.empty?)
      temp_arr = []
      arr.each do |ele|
        temp_arr << ele.left if ele.left
        temp_arr << ele.right if ele.right
      end
      result << arr.last
      arr = temp_arr
    end
    result
  end

  def print_left
    return unless self.value || self.left || self.right
    arr = []
    result = []
    arr << self
    while(!arr.empty?)
      temp_arr = []
      arr.each do |ele|
        temp_arr << ele.left if ele.left
        temp_arr << ele.right if ele.right
      end
      result << arr.first
      arr = temp_arr
    end
    result
  end

  def print_right1(root=self, level=1)
    # print "#{@last_level} "
    return if root.nil?
    if @last_level < level
      print "#{root.value} "
      @last_level = level
    end
    print_right1(root.right, level+1)
    print_right1(root.left, level+1)
  end

  def print_left1(root=self, level=1)
    return if root.nil?
    if @last_level < level
      print "#{root.value} "
      @last_level = level
    end
    print_left1(root.left, level+1)
    print_left1(root.right, level+1)
  end

  def top_view(root=self, height = 0, horizontal_distance = 0, height_map = {})
    return if root.nil?
    root.horizontal_distance = horizontal_distance
    height_map[horizontal_distance] = [height,root] if !height_map[horizontal_distance] || height_map[horizontal_distance][0] > height
    top_view(root.left, height+1, horizontal_distance-1, height_map)
    top_view(root.right, height+1, horizontal_distance+1, height_map)
    height_map
  end

  def size
    1 + (left&.size || 0) + (right&.size || 0)
  end

  def max_depth
    1 + [(self.left&.max_depth || 0), (self.right&.max_depth || 0)].max
  end

  def sum_at_max_depth(depth=0)
    return [self.value, depth] if left.nil? && right.nil?
    left_sum = left&.sum_at_max_depth(depth+1)
    right_sum = right&.sum_at_max_depth(depth+1)
    return [left_sum[0] + right_sum[0], left_sum[1]] if left_sum[1] == right_sum[1]
    return [left_sum[0], left_sum[1]] if left_sum[1] > right_sum[1]
    return [right_sum[0], right_sum[1]] if right_sum[1] > left_sum[1]
  end

  def continuous?
    return true if self.value && !self.left && !self.right
    return (self.value - self.right.value).abs == 1 && right.continuous? unless self.left
    return (self.value - self.left.value).abs == 1 && left.continuous? unless self.right
    (self.value - self.left.value).abs == 1 && left.continuous? && (self.value - self.right.value).abs == 1 && right.continuous?
  end

  def mirror?(root1 = self, root2 = self)
    return true if root1.nil? && root2.nil?
    root1.value == root2.value && mirror?(root1.left, root2.right) && mirror?(root1.right, root2.left)
  end

  def inorder_stack
    result = []
    current = self
    stack = []
    while(!current.nil? || !stack.empty?)
      while(!current.nil?)
        stack.unshift current
        current = current.left
      end
      current = stack.first
      stack.delete_at 0
      result << current.value
      current = current.right
    end
    result
  end


  def morris_inorder(root = self)
    pre = nil
    current = root
    while !current.nil?
      if current.left.nil?
        print "#{current.value} "
        current = current.right
      else
        pre = current.left
        while(pre.right.nil? && pre.right != current)
          pre = pre.right
        end
        if pre.right.nil?
          pre.right = current
          current = current.left
        else
          pre.right = nil
          print "#{current.value} "
          current = current.right
        end
      end
    end
  end

  def level_order(root = self)
    result = []
    q = []
    q << root
    while(!q.empty?)
      current = q[0]
      q.delete_at(0)
      result << current.value
      q << current.left if current.left
      q << current.right if current.right
    end
    result
  end
end

#
#                          1
#
#              2                        3
#        4           5            6           7
#    8       9   10     11    12     13

#      2
#   3     3
# 4   2 2   4
#
bt1 = BinaryTree.new(1)
bt2 = BinaryTree.new(2)
bt1.left = bt2
bt3 = BinaryTree.new(3)
bt1.right = bt3
bt4 = BinaryTree.new(4)
bt2.left = bt4
bt5 = BinaryTree.new(5)
bt2.right = bt5
bt6 = BinaryTree.new(6)
bt3.left = bt6
bt7 = BinaryTree.new(7)
bt3.right = bt7
bt8 = BinaryTree.new(8)
bt4.left = bt8
bt9 = BinaryTree.new(9)
bt4.right = bt9
bt10 = BinaryTree.new(10)
bt5.left = bt10
bt11 = BinaryTree.new(11)
bt5.right = bt11
bt12 = BinaryTree.new(12)
bt6.left = bt12
bt13 = BinaryTree.new(13)
bt6.right = bt13

bt1.print_inorder
puts ""
# bt1.print_preorder
# puts ""
# bt1.print_postorder
# puts ""

# print bt1.print_right.map(&:value)
# puts ""
# print bt1.print_left.map(&:value)
# puts ""
# bt1.last_level = 0
# print bt1.print_right1
# puts ""
# bt1.last_level = 0
# bt1.print_left1
# bt1.top_view
# puts bt1.size
# puts bt1.max_depth
# print bt1.sum_at_max_depth
# puts bt1.continuous?
# puts bt1.mirror?
# print bt1.inorder_stack
# bt1.morris_inorder

print bt1.level_order