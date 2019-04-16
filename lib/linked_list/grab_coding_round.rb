/*
Given an alert system that posts a message m at time t. If there are duplicate messages within a duration D, the system will not post the same message again. Given queries (m, t) in strictly ascending order of t, for each query, return true if the system should post m.

Example:
D = 10
"CPU load is high on machine 2", 1        ==> true
"Memory available is low on machine 1", 2 ==> true
"Memory available is low on machine 1", 3 ==> false
"Memory available is low on machine 1", 4 ==> false
"CPU load is high on machine 2", 10       ==> false
"CPU load is high on machine 2", 11       ==> false
"CPU load is high on machine 2", 12       ==> true
"CPU load is high on machine 2", 13       ==> true
"CPU load is high on machine 3", 100      ==> true
[1,2,3,4,6,10,12,14,100]
*/


class ListNode
    attr_accessor :message, time
    
    def initialize(message, time)
        self.message = message
        self.time = time
    end
end

class List
    attr_accessor :head, :tail
    
    def initialize
        self.head = nil
        self.tail = nil
    end
    
    def add(node)
        unless head
            self.head = node
            self.tail = node
            return
        end
        self.tail.next = node
        self.tail = tail.next
    end
    
    def discard(time_difference, message_hash)
        return if head.nil?
        while(head.time < time_difference)
            message_hash.delete head
            temp = head
            head = head.next
        end    
    end
end
message_hash = {}
list = List.new
def query(message, time, d)
    node = ListNode.new(message, time)
    list.discard(time - d, message_hash)
    unless message_hash[node]
        list.add(node)
        message_hash[node] = time
        return true
    end
    return false if time - message_hash[node] <= d
    message_hash[node] = time
    list.add(node)
    return true
end
