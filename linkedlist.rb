class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

  def push(value)
    @data = LinkedListNode.new(value, @data)
  end

  def pop
    value = @data.value
    @data = @data.next_node
    return value
  end
end

def reverse_list(list)
  stack = Stack.new
  while list != nil
    stack.push(list.value)
    list = list.next_node
  end
  stack.data
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} -->"
    print_values(list_node.next_node)
  else
    print "nil"
    return
  end
  puts ""
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

puts "Original stack:"
puts "---------------"
print_values(node3)
puts "---------------"
reverse = reverse_list(node3)
puts "      Reversed:"
puts "---------------"
print_values(reverse)
puts "---------------"
puts " "
# puts "- OR -"
# puts "Ruby and its wondrous memory allocation!"
# puts "-----------"
# puts "Pushing 1, 2, 3, 4, 5"
# arr = []
# arr.push(1, 2, 3, 4, 5)
# puts "-----------"
# puts "Listing in order"
# puts arr
# puts "-----------"
# puts "Last item popped: #{arr.pop}"
# arr.push(5)
# puts "-----------"
# puts "Reversed"
# puts arr.reverse
