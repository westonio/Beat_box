class LinkedList
  attr_reader :head, :count

  def initialize
    @head = nil
    @count = 0
  end


  def append(sound)
    if @head == nil
      @count += 1
      @head = Node.new(sound)
    else
      current_node = @head
      until current_node.next_node == nil
        current_node = current_node.next_node
      end
      @count += 1
      current_node.add_node(sound)
    end
  end


  def to_string # Need to re-write to allow for multiple strings together
    @head.data.to_s
  end
end