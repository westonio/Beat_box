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

  it 'has a list' do
    bb = BeatBox.new

    expect(bb.list).to be_an_instance_of(LinkedList)
  end
end