require './lib/linked_list'
require './lib/node'
require 'rspec'
require 'pry'


RSpec.describe LinkedList do
  it 'is an instance of' do
    list = LinkedList.new

    expect(list).to be_an_instance_of(LinkedList)
  end

  it 'can append nodes' do
    list = LinkedList.new

    list.append("doop")
    expect(list.head).not_to eq nil
    expect(list.head.data).to eq("doop")
  end

  it 'has a next_node of nil' do
    list = LinkedList.new

    list.append("doop")
    expect(list.head.next_node).to eq nil
  end

  it 'can count nodes in the linked list' do
    list = LinkedList.new

    list.append("doop")
    expect(list.count).to eq 1
  end

  it 'can return the nodes data as a string' do
    list = LinkedList.new

    list.append("doop")
    expect(list.to_string).to eq("doop")
  end

  it 'can append multiple nodes' do
    list = LinkedList.new

    list.append("doop")
    list.append("beep")
    list.append("duub")
    expect(list.head.data).to eq("doop")
    expect(list.head.next_node.data).to eq("beep")
    expect(list.head.next_node.next_node.data).to eq("duub")
    expect(list.head.next_node.next_node.next_node).to eq nil
  end

  it 'can count multiple nodes' do
    list = LinkedList.new

    list.append("doop")
    list.append("beep")
    list.append("duub")
    list.append("boot")
    expect(list.count).to eq 4
  end
end