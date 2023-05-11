class Node
  attr_reader :data, :next_node

  def initialize(data)
    @data = data
    @next_node = nil
  end

  # Adds the next node in the list
  def add_node(data)
    @next_node = Node.new(data)
  end
end