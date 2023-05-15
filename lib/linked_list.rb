class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def count
    current_count = 0
    current_node = @head
    
    until current_node.nil? # until current node == nil
      current_count += 1
      current_node = current_node.next_node
    end
    
    current_count
  end

  def append(sound)
    if @head.nil?
      @head = Node.new(sound)
    else
      current_node = @head
      until current_node.next_node.nil?
        current_node = current_node.next_node
      end
      current_node.add_node(sound)
    end
  end

  def to_string
    current_node = @head
    string = ""

    string = "Error: List is empty" if current_node.nil? # throws error if list is empty
    
    until current_node.nil? 
      string += " #{current_node.data}"
      current_node = current_node.next_node
    end
   
    string.lstrip # remove the leading space and returns string
  end

  def prepend(sound)
    new_head = Node.new(sound) #creates new node
    new_head.add_node(@head) # add current head as next node
    @head = new_head # re-assign head to this new node
  end

  # Created .move_position method to reduce repeated code for .insert and .find
  def move_position(number)
    current_node = @head
    
    (number - 1).times do # This ensures we add a node after the given node (e.g. the first node as the head is zero)
      current_node = current_node.next_node
    end
    
    current_node
  end

  def insert(position, sound)
    if position > count
      "The list is currently #{count} nodes long. You cannot insert a node here."
    elsif position == 0 
      prepend(sound)
    else
      current_node = move_position(position)
      
      if current_node.next_node.nil? # if at tail, just add
        current_node.add_node(sound)
      else # if not at the tail
        pointer_node = current_node.next_node 
        new_node = current_node.add_node(sound) #adds node after current node
        new_node.add_node(pointer_node) # attaches previous node's next_nod as the next node for inserted
      end
    end
  end

  def find(position,return_num)
    if position > count
      "No data found at starting point. The list is #{count} nodes long."
    elsif (position + return_num) > count
      "Argument Error: Starting at node #{position}, only #{count - position} node(s) can be returned"
    else
      current_node = move_position(position)

      found_list = LinkedList.new
      return_num.times do
        current_node = current_node.next_node
        found_list.append(current_node.data)
      end

      found_list.to_string
    end
  end

  def includes?(sound)
    current_node = @head
    includes = false
    
    return "Error: List is empty" if current_node.nil? # first check to see if list is empty
    
    until current_node.nil?
      if current_node.data == sound 
        includes = true 
        break # this ensures true is returned by stopping the loop
      end 
      
      current_node = current_node.next_node
    end

    includes
  end

  def pop
    current_node = @head

    return "Error: List is empty" if current_node.nil?
  
    until current_node.next_node.next_node.nil? # until we get to the second to last
      current_node = current_node.next_node
    end
    
    last_node = current_node.next_node.data
    current_node.remove_node
    last_node
  end
end