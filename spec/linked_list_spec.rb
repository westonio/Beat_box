require './lib/linked_list'
require './lib/node'
require 'rspec'
require 'pry'


RSpec.describe Linked_List do
  it 'is an instance of' do
    list = Linked_List.new

    expect(list).to be_an_instance_of(Linked_List)
  end

  it 'can append nodes' do
    list = Linked_List.new

    list.append("doop")
    expect(list.head).not_to eq nil
  end

  it 'has a next_node of nil' do
    list = Linked_List.new

    list.append("doop")
    expect(list.head.next_node).to eq nil
  end

  it 'has a count of nodes in the list' do
    list = Linked_List.new

    list.append("doop")
    expect(list.count).to eq 1
  end

  it 'can return the nodes data as a string' do
    list = Linked_List.new

    list.append("doop")
    expect(list.to_string).to eq("doop")
  end
end