class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def count
    current_count = 0
    current_node = @head
    if current_node == nil
      current_count
    else
      current_count = 1 # This accounts for if there is only a head node
      until current_node.next_node == nil
        current_node = current_node.next_node
        current_count += 1
      end
      current_count
    end 
  end

  def append(sound)
    if @head == nil
      @head = Node.new(sound)
    else
      current_node = @head
      until current_node.next_node == nil
        current_node = current_node.next_node
      end
      current_node.add_node(sound)
    end
  end


  def to_string
    current_node = @head
    if current_node == nil
      "There are currently no nodes within the linked list."
    else
      string = @head.data # This accounts for when there is only a head in the list
      until current_node.next_node == nil
        current_node = current_node.next_node
        string = string + " " + current_node.data
      end
    end
    string
  end


  def prepend(sound)
    if @head == nil
      @head = Node.new(sound)
    else
      old_head = @head
      new_head = Node.new(sound)
      new_head.add_node(old_head)
      @head = new_head
    end
  end

  def insert(position, sound)
    current_node = @head
    if current_node == nil && position != 0 || position > count
      "The list is currently #{count} nodes long. You cannot insert a node here."
    elsif position == 0 && current_node == nil
      append(sound)
    elsif position == 0 && current_node != nil
      prepend(sound)
    else
      position = position - 1 # This ensures we add a node after the given node (e.g. the first node as the head is zero)
      position.times do
        current_node = current_node.next_node
      end
      
      if current_node.next_node == nil
        new_node = current_node.add_node(sound)
      else
        pointer_node = current_node.next_node
        new_node = current_node.add_node(sound)
        new_node.add_node(pointer_node)
      end
    end
  end

  def find(position,return_num)
    current_node = @head
    if current_node == nil || position > count
      "No data found at starting point. The list is #{count} nodes long."
    elsif position + return_num > count
      "Argument Error: Starting at node #{position}, only #{count - position} node(s) can be returned"
    else
      #find the node at the given position
      position = position - 1 # This ensures we add a node after the given node (e.g. the first node as the head is zero)
      position.times do
        current_node = current_node.next_node
      end
      #return the found nodes
      string = "" 
      return_num.times do
        current_node = current_node.next_node
        string = string + " #{current_node.data}"
      end
      string.lstrip # This removes the leading space created in the loop ( "_dubb" => "dubb" )
    end
  end

  def includes?(sound)
    current_node = @head
    if current_node == nil
      "Error: List is empty"
    else
      until current_node.next_node == nil
        current_node = current_node.next_node
        if current_node.data == sound 
           includes = true 
           break
        else
          includes = false
        end
      end
      includes
    end
  end

  def pop
    current_node = @head

    if current_node == nil
      "Error: List is empty"
    else
      until current_node.next_node.next_node == nil # until we get to the second to last
        current_node = current_node.next_node
      end
      last_node = current_node.next_node.data
      current_node.remove_node
      last_node
    end
  end
end