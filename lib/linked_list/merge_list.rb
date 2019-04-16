class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end



def merge_two_lists(l1, l2)
  head1 = l1
  head2 = l2
  l3 = ListNode.new(0)
  head3 = l3
  while(!head1.nil? && !head2.nil?)
    if head1.val < head2.val
      head3.next = head1
      head1 = head1.next
      head3 = head3.next
    else
      head3.next = head2
      head2 = head2.next
      head3 = head3.next
    end
  end
  pending = head1.nil? ? head2 : head1
  while(!pending.nil?)
    head3.next = pending
    pending = pending.next
    head3 = head3.next
  end
  l3.next
end



node1 = ListNode.new(1)
node3 = ListNode.new(3)
node1.next = node3
node5 = ListNode.new(5)
node3.next = node5



node2 = ListNode.new(2)
node4 = ListNode.new(4)
node2.next = node4
node6 = ListNode.new(6)
node4.next = node6
node7 = ListNode.new(7)
node6.next = node7

head = merge_two_lists(node1, node2)
node = head
while(!node.nil?)
  print "#{node.val} "
  node = node.next
end