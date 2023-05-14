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

  def play
    `say -r 200 -v Rocko #{@list.to_string}`
  end
end