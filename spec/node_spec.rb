require 'rspec'
require './lib/node'

RSpec.describe Node do
  it 'is an instance of' do
    node = Node.new("splooie")

    expect(node).to be_an_instance_of(Node)
  end

  it 'has data' do
    node = Node.new("splooie")

    expect(node.data).to eq("splooie")
  end

  it 'has a next = nil' do
    node = Node.new("splooie")

    expect(node.next).to eq nil
  end

  it 'has an add method' do
    node = Node.new("splooie")
    node.add("poot")

    expect(node.next).to be_an_instance_of(Node)
    expect(node.next.data).to eq("poot")
  end

  it 'can add existing nodes to next' do
    node_1 = Node.new("splooie")
    node_2 = Node.new("boooie")
    
    node_2.add(node_1)
    expect(node_2.next).to eq(node_1)
    expect(node_1.next).to eq nil
  end

  it 'can remove existing nodes' do
    node_1 = Node.new("splooie")
    node_2 = Node.new("boooie")

    node_1.add(node_2)
    node_1.remove
    expect(node_1.next).to eq nil
  end
end