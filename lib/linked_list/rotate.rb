# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def rotate_right(head, k)
  return if head.nil?
  return head if head.next.nil?
  return head if k == 0
  length = 0
  current = head
  while(!current.nil?)
    current = current.next
    length += 1
  end
  k %= length
  return head if k == 0
  i = 0
  fast = head 
  while(i < k)
    fast = fast.next
    i += 1
  end
  slow = head
  while(!fast.next.nil?)
    slow = slow.next
    fast = fast.next
  end
  fast.next = head
  head = slow.next
  slow.next = nil 
  head
end

n1 = ListNode.new(1) 
n2 = ListNode.new(2)
n3 = ListNode.new(3)
n4 = ListNode.new(4)
n5 = ListNode.new(5)
n1.next = n2
n2.next = n3
n3.next = n4
n4.next = n5
new_head = rotate_right(n1, 6)
binding.irb