require './lib/linked_list'
require './lib/node'
require 'rspec'
require 'pry'


RSpec.describe LinkedList do
  it 'is an instance of' do
    list = LinkedList.new

    expect(list).to be_an_instance_of(LinkedList)
  end
  
# feature .append
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
  
# feature .count
  it 'can count nodes in the linked list' do
    list = LinkedList.new
    
    expect(list.count).to eq 0
    list.append("doop")
    expect(list.count).to eq 1
  end

  it 'can count multiple nodes' do
    list = LinkedList.new
    list.append("doop")
    list.append("beep")
    list.append("duub")
    list.append("boot")

    expect(list.count).to eq 4
  end

# feature .to_string
  it 'can return the nodes data as a string' do
    list = LinkedList.new
    list.append("doop")

    expect(list.to_string).to eq("doop")
  end

  it 'can return all nodes data as a single string' do
    list = LinkedList.new
    list.append("doop")
    list.append("beep")
    list.append("duub")
    list.append("boot")

    expect(list.to_string).to eq("doop beep duub boot")
  end
  
# feature .prepend
  it 'can prepend a node at the beginning' do
    list = LinkedList.new
    list.prepend("doop")
    expect(list.head.data).to eq("doop")

    list.prepend("beep")
    expect(list.head.data).to eq("beep")
    expect(list.head.next_node.data).to eq("doop")
  end

 # feature .move_position
  it 'can find the current node position' do
    list = LinkedList.new
    node_1 = list.append("doop")
    node_2 = list.append("beep")
    node_3 = list.append("duub")

    expect(list.move_position(1)).to eq(node_1)
    expect(list.move_position(2)).to eq(node_2)
    expect(list.move_position(3)).to eq(node_3)
  end


# feature .insert
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

  it 'returns error if list is empty' do
    list = LinkedList.new

    expect(list.to_string).to eq("Error: List is empty")
  end

# feature .find
  it 'can find and return multiple nodes' do
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

# feature .includes?
  it 'has .includes? method' do
    list = LinkedList.new
    list.append("doop")
    list.append("beep")

    expect(list.includes?("beep")).to eq true
    expect(list.includes?("koop")).to eq false
    expect(list.includes?("doop")).to eq true
  end

  it 'returns error if .includes? called on empty list' do
    list = LinkedList.new

    expect(list.includes?("beep")).to eq("Error: List is empty")
  end

# feature .pop
  it 'has .pop method to remove last node' do
    list = LinkedList.new
    list.append("doop")
    list.append("beep")
    list.pop

    expect(list.to_string).to eq("doop")
  end

  it 'returns node that is popped off' do
    list = LinkedList.new
    list.append("doop")
    list.append("beep")

    expect(list.pop).to eq("beep")
  end

  it 'returns error if list is empty' do
    list = LinkedList.new

    expect(list.pop).to eq("Error: List is empty")
  end

  it 'can can still pop is only one node' do
    list = LinkedList.new
    list.append("doop")

    expect(list.pop).to eq("doop")
  end
end