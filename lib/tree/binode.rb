class Node 
	attr_accessor :value, :left, :right

  def initialize(value)
  end
end


class BinaryTree
  attr_accessor :root

  def convert_to_circular(head)
    return nil if head.nil?

    part1 = convert_to_circular(head.left)
    part3 = convert_to_circular(head.right)

    if part1.nil? && part3.nil?
      head.left = head
      head.right = head
      return head
    end

    tail3 = part3.nil? ? nil : part3.left

    if part1.nil?
      concat(part3.left, root)
    else
      concat(part1.left, root)
    end


    if part3.nil?
      concat(root, part1)
    else
      concat(root, part3)
    end


    if part1.nil? && part3.nil?
      concat(tail3, part1)
    end

    part1.nil? ? head : part1

  end


  def convert
    convert_to_circular(self.root)
    head.left.right = nil
    head.left = nil
    head
  end
end