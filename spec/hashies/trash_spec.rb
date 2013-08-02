require 'spec_helper'

describe Hashies::Trash do
  before do
    class PersonTwo < Hashies::Trash
      property :first_name, :from => :firstName
    end
  end

  it "" do
    p = PersonTwo.new(:firstName => 'Bob')
    expect( p.first_name  ).to eq 'Bob'
  end
end
