class BeatBox
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(words)
    words.split(' ').map do |word|
      @list.append(word)
    end
  end
end