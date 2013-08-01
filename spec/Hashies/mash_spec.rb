# require 'mash'
require 'spec_helper'

describe Hashies::Mash do
  before do
    @mash = Hashies::Mash.new
  end
  
  it "" do
    @mash.should_not == nil 
  end
  
  it "" do
    @mash.name?.should == false 
  end
  
  it "" do
    @mash.name.should == nil
  end
  
  it "" do
    @mash.name = "My Mash"
    @mash.name.should == "My Mash"
  end

  it "" do
    @mash.name = "My Mash"
    @mash.name?.should == true
  end
end

describe Hashies::Mash do
  before do
    @mash = Hashies::Mash.new
  end
  
  it "" do
    @mash.author!.name = "Michael Bleigh"
    @mash.author.name.should == "Michael Bleigh" 
    #puts @mash.author # => <Hashie::Mash name="Michael Bleigh">
  end
end

describe Hashies::Mash do
  before do
    @mash = Hashies::Mash.new
  end
  
  it "" do
    @mash.author_.should == nil
    @mash.author!
    
    @mash.author_.should_not == nil
    @mash.author_.name?.should == false
  end
end
