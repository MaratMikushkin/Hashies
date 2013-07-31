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

  # it "" do
  #   @mash.name = "My Mash"
  #   @mash.name?.should == true
  # end
end

describe Hashies::Mash do
  before do
    @mash = Hashies::Mash.new
  end
## use bang methods for multi-level assignment
#mash.author!.name = "Michael Bleigh"
#mash.author # => <Hashie::Mash name="Michael Bleigh">
end



#mash = Mash.new
## use under-bang methods for multi-level testing
#mash.author_.name? # => false
#mash.inspect # => <Hashie::Mash>
