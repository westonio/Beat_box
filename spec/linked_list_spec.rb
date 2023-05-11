require './lib/linked_list'
require './lib/node'
require 'rspec'


RSpec.describe Linked_List do
  it 'is an instance of' do
    linked_list = Linked_List.new

    expect(linked_list).to be_an_instance_of(Linked_List)
  end
end