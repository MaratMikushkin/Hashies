class Mash
  def initialize
    @hash = {}
  end
  
  def method_missing(m, *args)
    key = m.to_s[0-1]
    case m.to_s[-1]
    when '?'
      return @hash[m] != nil ? true : false
    when '!'
      #
    when '_'
      #
    else
      @hash[m] = args[0]
    end
  end
end

describe Mash do
  before do
    @mash = Mash.new
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
    @mash.name?.should == true
  end
end

describe Mash do
  before do
    @mash = Mash.new
  end
## use bang methods for multi-level assignment
#mash.author!.name = "Michael Bleigh"
#mash.author # => <Hashie::Mash name="Michael Bleigh">
end



#mash = Mash.new
## use under-bang methods for multi-level testing
#mash.author_.name? # => false
#mash.inspect # => <Hashie::Mash>
