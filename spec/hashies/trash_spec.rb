require 'spec_helper'

describe Hashies::Trash do
  before do
    class PersonTwo < Hashies::Trash
      property :first_name, :from => :firstName
    end

    class Result < Hashies::Trash
      property :id, :transform_with => lambda { |v| v.to_i }
      property :created_at, :from => :creation_date, :with => lambda { |v| Time.parse(v) }
    end
  end

  it "" do
    p = PersonTwo.new(:firstName => 'Bob')
    expect( p.first_name  ).to eq 'Bob'
  end

  it "" do
    result = Result.new(:id => '123', :creation_date => '2012-03-30 17:23:28')
    expect(result.id.class).to eq Fixnum
    expect(result.created_at.class).to eq Time
  end

  it "" do
    #result = Result.new(:id => '123', :creation_date => '2012-03-30 17:23:28')
    #expect(result.created_at.class).to eq Time
  end
end
