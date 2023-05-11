class LinkedList
  attr_reader :head, :count

  def initialize
    @head = nil
    @count = 0 # This is incorrect usage based off of requirements, need to re-write as a separate method
  end

  def append(sound)
    if @head == nil
      @count += 1
      @head = Node.new(sound)
    else
      @count += 1
      @head.add_node(sound)
    end
  end


  def to_string
    @head.data.to_s
  end
end