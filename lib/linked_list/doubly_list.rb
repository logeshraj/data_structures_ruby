module LinkedList
  class DoublyNode
    attr_accessor :value, :prev, :next

    def initialize(value)
      self.value = value
    end
  end
end


module LinkedList
  class DoublyList
    attr_accessor :head, :tail

    def append(value)
      new_node = LinkedList::DoublyNode.new(value)
      new_node.prev = nil
      new_node.next = nil
      if self.head == nil
        self.head = new_node
        self.tail = new_node
        return
      end
      node = tail
      node.next = new_node
      new_node.prev = node
      self.tail = new_node
    end

    def print_all
      return puts 'empty' unless head
      node = head
      loop do
        print node.value
        if node.next
          print ' <-> ' 
        else
          print "\n"
          break
        end
        node = node.next
      end
    end

    def print_reverse
      return puts 'empty' unless tail
      node = tail
      loop do
        print node.value
        if node.prev
          print ' <-> ' 
        else
          print "\n"
          break
        end
        node = node.prev
      end
    end

  end
end


dl = LinkedList::DoublyList.new
dl.append(1)
dl.append(2)
dl.append(3)
dl.append(4)
dl.append(5)

dl.print_all

dl.print_reverse