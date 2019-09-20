class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def reverse_pointer(node, previous = nil)
  #Check existence of next node
  if node.next_node != nil
    #Call the next node, passing current node's location
    reverse_pointer(node.next_node, node)
    #Redefine the node's next node call to the previous value
    node.next_node = previous  
  else
    #When next node is nil, simply set the current nodes next to prior node
    node.next_node = previous
    return node.value
  end

end

def reverse_list(list)
  #Initialize stack
  stack = Stack.new
  #Check existence of node
  while list != nil
    #Push value of current node into stack
    stack.push(list.value)
    #Move to next node
    list = list.next_node   
  end
  #Commit changes to stack
  stack.data
end

def print_values(list_node)
  #Check existence of node
  if list_node != nil
    #Print value of current node
    print "#{list_node.value} -->"
    #Call function again on next node
    print_values(list_node.next_node)
  else
    print "nil"
    return
  end
  #Aesthetic spacer only
  puts ""
end

node1 = LinkedListNode.new(1)
node2 = LinkedListNode.new(66, node1)
node3 = LinkedListNode.new(3, node2)
node4 = LinkedListNode.new(404, node3)

puts "Original stack:"
puts "---------------"
print_values(node4)

puts "Reversed stack:"
puts "---------------"
reverse = reverse_list(node4)
print_values(reverse)

puts ""
puts "Reversed pointers (No stack):"
puts "---------------"

reverse_pointer(node4)
print_values(node1)
puts "Head of new list/Tail of unaltered list"
puts "---------------"
puts reverse_pointer(node4)
