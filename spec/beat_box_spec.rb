require './lib/beat_box'
require './lib/linked_list'
require './lib/node'
require 'rspec'
require 'pry'


RSpec.describe BeatBox do
  it 'is an instance ofbeat' do
    bb = BeatBox.new

    expect(bb).to be_an_instance_of(BeatBox)
  end
end