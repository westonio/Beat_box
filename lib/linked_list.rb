class Linked_List
  attr_reader :head, :count

  def initialize
    @head = nil
    @count = 0
  end

  def append(sound)
    @count += 1
    @head = Node.new(sound)
  end
end