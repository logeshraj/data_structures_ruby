module LinkedList
  class DoublyNode
    attr_accessor :value, :prev, :next

    def initialize(value)
      self.value = value
    end
  end
end