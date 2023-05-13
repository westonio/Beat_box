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

  it 'can return all nodes data as a single string' do
    list = LinkedList.new
    list.append("doop")
    list.append("beep")
    list.append("duub")
    list.append("boot")

    expect(list.to_string).to eq("doop beep duub boot")
  end

  it 'can prepend a node at the beginning' do
    list = LinkedList.new
    list.append("doop")

    list.prepend("beep")
    expect(list.head.data).to eq("beep")
    expect(list.head.next_node.data).to eq("doop")
  end

  it 'can insert at a given position in the linked list' do
    list = LinkedList.new
    list.append("doop")
    list.append("beep")
    list.append("duub")

    list.insert(1,"siip")
    expect(list.to_string).to eq("doop siip beep duub")
    expect(list.head.next_node.data).to eq("siip")
  end

  it 'gives an error if trying to insert node at invalid position' do
    list = LinkedList.new
    list.append("doop")
    list.append("beep")
    
    expect(list.insert(4,"siip")).to eq("The list is currently 2 nodes long. You cannot insert a node here.")
  end

  it 'insert can insert a node at the beginning' do
    list = LinkedList.new
    list.append("doop")

    list.insert(0,"siip")
    expect(list.to_string).to eq("siip doop")
  end

  it 'can insert a node at the end' do
    list = LinkedList.new
    list.append("doop")
    list.append("beep")
    list.append("duub")

    list.insert(3,"siip")
    expect(list.to_string).to eq("doop beep duub siip")
  end

  it 'can find a node position and return multiple nodes' do
    list = LinkedList.new
    list.append("doop")
    list.append("beep")
    list.append("duub")
    list.append("siip")
    
    find = list.find(2,2)
    expect(find).to eq("duub siip")
  end

  it 'gives an error if trying to find when no nodes present' do
    list = LinkedList.new
    
    find = list.find(3,2)
    expect(find).to eq("No data found at starting point. The list is 0 nodes long.")
  end

  it 'gives an error if trying to start in position greater than list length' do
    list = LinkedList.new
    list.append("doop")
    list.append("beep")

    find = list.find(3,2)
    expect(find).to eq("No data found at starting point. The list is 2 nodes long.")
  end

  it 'gives an error if trying to find more nodes than present' do
    list = LinkedList.new
    list.append("doop")
    list.append("beep")
    list.append("duub")
    list.append("siip")
    
    find = list.find(3,2)
    expect(find).to eq("Argument Error: Starting at node 3, only 1 node(s) can be returned")
  end

  it 'has .includes? method' do
    list = LinkedList.new
    list.append("doop")
    list.append("beep")

    expect(list.includes?("beep")).to eq true
    expect(list.includes?("koop")).to eq false
  end
end