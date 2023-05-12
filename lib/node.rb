class Node
  attr_reader :data, :next_node

  def initialize(data)
    @data = data
    @next_node = nil
  end

  # Adds the next node in the list
  def add_node(data)
    if data.is_a?(Node)
      @next_node = data
    else
      @next_node = Node.new(data)
    end
  end
end