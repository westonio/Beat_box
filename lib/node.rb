class Node
  attr_reader :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end

  # Adds the next node in the list
  def add(data)
    if data.is_a?(Node)
      @next = data
    else
      @next = Node.new(data)
    end
  end

  def remove
    @next = nil
  end
end