class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end


def swap_pairs(head)
	dummy = ListNode.new(0)
  dummy.next = head
  l1 = dummy
  while(!l1.nil?)
    first = l1.next
    break unless first
    second = l1.next.next
    break unless second
    first.next = second.next
    l1.next = second
    second.next = first
    l1 = first
  end
  dummy.next
end


# dummy - 1 - 2 - 3

node1 = ListNode.new(1)
node2 = ListNode.new(2)
node1.next = node2
node3 = ListNode.new(3)
node2.next = node3
node4 = ListNode.new(4)
node3.next = node4
node5 = ListNode.new(5)
node4.next = node5

head = swap_pairs(node1)
node = head
while(!node.nil?)
  print "#{node.val} "
  node = node.next
end
