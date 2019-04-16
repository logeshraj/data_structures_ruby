class TrieNode
  attr_accessor :value, :indexes, :children

  def initialize
    self.children = {}
    self.indexes = []
  end

  def insert_string(str, index)
    self.indexes.push index
    if str.nil? || str.length <= 0
      children["\0"] = nil
      return 
    end
    value = str[0]
    child = nil
    child = children[value] if children[value]
    child = TrieNode.new
    children[value] = child
    remainder = str[1..str.length-1]
    child.insert_string(remainder, index+1)
  end

  def search(str)
    return indexes if str.nil? || str.length ==0
    first = str[0]
    if children[first]
      remainder = str[1..str.length-1]
      return children[first].search[remainder]
    end
  end

  def terminates?
    children["\0"]
  end
end


class Trie

  attr_accessor :root

  def initialize(str)
    self.root = TrieNode.new
    insert_string(str, 0)
  end

  def insert_string(str, loc)
    root.insert_string(str, loc)
  end

  def search(str)
    root.search(str)
  end
end

def search_all(big, smalls)
  lookup = {}
  trie = create_trie_for_string(big)
  smalls.each do |small|
    locations = trie.search(s)
    subtract_value(locations, small.length)
    lookup[small] = locations
  end
end

def create_tree_for_string(str)
  trie = Trie.new
  i = 0
  while(i < str.length)
    sub_string = str[i..str.length-1]
    trie.insert_string(sub_string, i)
  end
  trie
end

def subtract_value(locations, delta)
  i = 0 
  while i < locations.length
    locations[i] = locations[i] - delta
  end
  locations
end