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
    expect(bb.list.head.data).to eq("deep")
    expect(bb.list.head.next_node.data).to eq("doo")
    expect(bb.list.head.next_node.next_node.data).to eq("ditt")
    expect(bb.list.head.next_node.next_node.next_node).to eq nil
  end

  it 'can return the count of the list' do
    bb = BeatBox.new
    
    bb.append("deep doo ditt")
    expect(bb.list.count).to eq(3)
    bb.append("beep boo bitt")
    expect(bb.list.count).to eq(6)
  end

  it 'can play the sounds' do
    bb = BeatBox.new
    
    bb.append("bimmmm nooooo nooooooo noooooo naaaaa bimmm taaaaa pit ti bimmmm taaaaa pit ti bimmmm")
    expect(bb.list.count).to eq(14)
    bb.play # Turn sound ON, this should play the sounds on your computer
# The line below does not actually verify what was commanded in the terminal
    # expect(bb.play).to eq(`say -r 200 -v Rocko "bimmmm nooooo nooooooo noooooo naaaaa bimmm taaaaa pit ti bimmmm taaaaa pit ti bimmmm"`)
  end
end