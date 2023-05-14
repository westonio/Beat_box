require './lib/beat_box'
require './lib/linked_list'
require './lib/node'
require 'rspec'
require 'pry'


RSpec.describe BeatBox do
  it 'is an instance of BeatBox' do
    bb = BeatBox.new

    expect(bb).to be_an_instance_of(BeatBox)
  end

  it 'has an empty list' do
    bb = BeatBox.new

    expect(bb.list).to be_an_instance_of(LinkedList)
    expect(bb.list.head).to eq nil
  end

  it 'adds multiples words from string' do
    bb = BeatBox.new
    bb.append("deep doo ditt")

    expect(bb.list.count).to eq(3)
    expect(bb.list.head).to eq("deep")
    expect(bb.list.head.next_node).to eq("doo")
    expect(bb.list.head.next_node.next_node).to eq("ditt")
  end
end