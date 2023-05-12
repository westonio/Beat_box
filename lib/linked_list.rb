class LinkedList
  attr_reader :head, :count

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


  def insert(number, sound)
    current_node = @head
    if current_node == nil && number != 0 || number > count
      "The list is currently #{count} nodes long. You cannot insert a node here."
    else
      position = number - 1 # This ensures we add a node after the given node (e.g. the first node as the head is zero)
      position.times do
        current_node = current_node.next_node
      end
      pointer_node = current_node.next_node
      new_node = current_node.add_node(sound)
      new_node.add_node(pointer_node)
    end
  end
end