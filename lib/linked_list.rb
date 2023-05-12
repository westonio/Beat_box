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
      until current_node.next_node == nil
        current_node = current_node.next_node
        current_count += 1
      end
      current_count + 1 # This +1 accounts for the tail node, which stopped the until statement above
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
end