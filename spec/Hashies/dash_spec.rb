require 'spec_helper'

describe Hashies::Dash do
  before do
    class Person < Hashies::Dash
      property :name, :required => true
      property :email
      property :occupation, :default => 'Rubyist'
    end
  end
  
  it "" do
    expect{ p = Person.new }.to raise_error ArgumentError
  end
  
  it "" do
    p = Person.new(:name => "Bob")
    expect(p.name).to eq "Bob" 
  end
  
  it "" do
    p = Person.new(:name => "Bob")
    expect{ p.name = nil }.to raise_error ArgumentError
  end
  
  #it "" do
  #  p = Person.new(:name => "Bob")
  #  p.email = 'abc@def.com'
  #  expect{ p.email }.to eq "abc@def.com"
  #end
  
  #it "" do
  #  p = Person.new(:name => "Bob")
  #  expect{ p.occupation }.to eq "Rubyist"
  #end
  
end
