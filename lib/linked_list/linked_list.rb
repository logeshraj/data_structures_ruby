module LinkedList
  class Node
    attr_accessor :value, :next

    def initialize(value)
      self.value = value
    end
  end
end


module LinkedList
  class LinkedList
    attr_accessor :head

    def append(value)
      node = ::LinkedList::Node.new(value)
      puts node.value
      return tail.next = node  if head
      self.head = node
    end

    def delete(value)
      if head.value == value
        self.head = head.next
        return
      end
      node = head
      while(node.next != nil)
        if node.next.value == value
          node.next = node.next.next
          break
        else
          node = node.next
        end
      end
    end

    def tail
      node = head
      return node if node.next == nil
      while node.next != nil
        node = node.next
      end
      node
    end

    def print_all
      return puts 'empty' unless head
      node = head
      loop do
        print node.value
        if node.next
          print ' -> ' 
        else
          print "\n"
          break
        end
        node = node.next
      end
    end

    def reverse
      current_node = head
      prev_node = nil
      next_node = nil
      while(current_node.next != nil) do
        next_node = current_node.next
        current_node.next = prev_node
        prev_node = current_node
        current_node = next_node
      end
      current_node.next = prev_node
      self.head = current_node
    end


    def recursive_reverse
      reverse_recursion(self.head, nil)
    end

    def reverse_recursion(current_node, prev_node)
      if (current_node.next == nil)
        self.head = current_node
        self.head.next = prev_node
        return
      else
        next_node = current_node.next
        current_node.next = prev_node
        reverse_recursion(next_node, current_node)
      end
    end

    def rotate(displacement)
      current_node = head
      (displacement-1).times do 
        current_node = current_node.next
      end
      future_head = current_node.next
      node = current_node.next
      while(node.next != nil) do
        node = node.next
      end
      node.next = self.head
      self.head = future_head
      current_node.next = nil
    end

    def print_middle
      single = head
      double = head
      while(double != nil && double.next != nil)
        single = single.next
        double = double.next.next
      end
      puts single.value
    end

    def make_it_circular
      node = head
      while(node.next!= nil) do
        node = node.next
      end
      node.next = head
    end

    def print_circular
      return puts 'empty' unless head
      node = head
      loop do
        print node.value
        if node.next != head
          print ' -> ' 
        else
          print "\n"
          break
        end
        node = node.next
      end
    end


    def detect_loop
      single = head
      double = head
      loop_detected = false
      while(double != nil && double.next != nil) do
        single = single.next
        double = double.next.next
        if single == double
          loop_detected = true
          puts "Loop detected"
          break
        end
      end
      puts "No loop detected" unless loop_detected
    end

    def remove_loop
    end

  end
end


ll = LinkedList::LinkedList.new

ll.append(1)
ll.append(2)
ll.append(3)
ll.append(4)
ll.append(5)

ll.print_all

# ll.rotate(2)
# ll.print_middle
# ll.make_it_circular
# ll.print_circular
ll.detect_loop
# ll.print_all