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

  it 'has a next_node = nil' do
    node = Node.new("splooie")

    expect(node.next_node).to eq nil
  end

  it 'has an add_node method' do
    node = Node.new("splooie")
    node.add_node("poot")

    expect(node.next_node).to be_an_instance_of(Node)
    expect(node.next_node.data).to eq("poot")
  end
end