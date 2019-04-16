class Node
  attr_accessor :value, :next

  def initialize(value)
    self.value = value
  end
end


class LinkedList
  attr_accessor :head, :tail

  def add(value)
    node = Node.new(value)
    if head.nil?
      self.head = node 
      self.tail = node
      return
    end
    self.tail.next = node
    self.tail = node
  end

  def print
    node = self.head
    while(node!=nil )
      puts node.value
      node = node.next
    end
  end

  def add_one(node=self.head)
    return if node.nil?
    if node.next.nil?
      value = node.value
      node.value = (value + 1) % 10
      return (value + 1) / 10 
    else
      remainder = add_one(node.next)
      value = node.value
      node.value = (value + remainder) % 10
      if node == self.head && value + remainder == 10
        temp = self.head
        self.head = Node.new(1)
        self.head.next = temp
      end
      return (value + remainder) / 10
    end
  end

end

ll = LinkedList.new

ll.add(1)
ll.add(9)
ll.add(9)

ll.print

ll.add_one

ll.print