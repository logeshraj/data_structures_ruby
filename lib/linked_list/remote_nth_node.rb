class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def remove_nth_from_end(head, n)
  i = 0
  dummy = ListNode.new(0)
  dummy.next = head
  fast = dummy
  slow = dummy
  while(i < n)
    fast = fast.next
    i+=1
  end
  binding.irb
  while(!fast&.next.nil?)
    slow = slow.next
    fast = fast.next
  end
  binding.irb
  slow.next = slow.next.next
  dummy.next
end


node1 = ListNode.new(1)
node2 = ListNode.new(2)
node1.next = node2
node3 = ListNode.new(3)
# node2.next = node3
node4 = ListNode.new(4)
node3.next = node4
node5 = ListNode.new(5)
node4.next = node5
node6 = ListNode.new(6)
node5.next = node6
node7 = ListNode.new(7)
node6.next = node7

head = remove_nth_from_end(node1, 2)
node = head
while(!node.nil?)
  print "#{node.val} "
  node = node.next
end