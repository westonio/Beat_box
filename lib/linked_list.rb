class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def count
    count = 0
    node = @head
    until node.nil? # until current node == nil
      count += 1
      node = node.next
    end
    count
  end

  def append(sound)
    if @head.nil?
      @head = Node.new(sound)
    else
      node = @head
      until node.next.nil?
        node = node.next
      end
      node.add(sound)
    end
  end

  def to_string
    node = @head
    string = ""
    string = "Error: List is empty" if node.nil? # throws error if list is empty
    until node.nil? 
      string += " #{node.data}"
      node = node.next
    end
    string.lstrip # remove the leading space and returns string
  end

  def prepend(sound)
    new_head = Node.new(sound) 
    new_head.add(@head) # add current head as next node
    @head = new_head # re-assign head to this new node
  end

  # Created .move_to method to reduce repeated code for .insert and .find
  def move_to(position)
    node = @head
    (position - 1).times do # This ensures we add a node after the given node (e.g. the first node as the head is zero)
      node = node.next
    end
    node
  end

  def insert(position, sound)
    if position > count
      "The list is currently #{count} nodes long. You cannot insert a node here."
    elsif position == 0 
      prepend(sound)
    else
      node = move_to(position)
      if node.next.nil? # if at tail, just add
        node.add(sound)
      else # if not at the tail
        pointer = node.next 
        new_node = node.add(sound) #adds node after current node
        new_node.add(pointer) # attaches previous node's next_nod as the next node for inserted
      end
    end
  end

  def find(position,return_num)
    if position > count
      "No data found at starting point. The list is #{count} nodes long."
    elsif (position + return_num) > count
      "Argument Error: Starting at node #{position}, only #{count - position} node(s) can be returned"
    else
      node = move_to(position) # first move to position
      found = LinkedList.new
      return_num.times do
        node = node.next
        found.append(node.data)
      end
      found.to_string
    end
  end

  def includes?(sound)
    node = @head
    includes = false
    return "Error: List is empty" if node.nil? # first check to see if list is empty
    until node.nil?
      if node.data == sound 
        includes = true 
        break # this ensures true is returned by stopping the loop
      end 
      node = node.next
    end
    includes
  end

  def pop
    node = @head
    return "Error: List is empty" if node.nil?
    if node.next.nil? #only one node in the list
      data = node.data
      @head = nil
    else
      until node.next.next.nil? # until we get to the second to last
        node = node.next
      end
      data = node.next.data
      node.remove
    end
    data
  end
end