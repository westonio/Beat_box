class BeatBox
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(words)
    words.split(' ').each do |word|
      @list.append(word)
    end
  end

  def count
    @list.count
  end
end