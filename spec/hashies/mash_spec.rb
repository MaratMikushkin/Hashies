require 'spec_helper'

describe Hashies::Mash do
  before do
    @mash = Hashies::Mash.new
  end

  it "" do
    expect(@mash).to be_true
  end

  it "" do
    expect(@mash.name?).to be_false
  end

  it "" do
    expect(@mash.name).to be_nil
  end

  it "assign name value" do
    @mash.name = "My Mash"
    expect(@mash.name).to eq "My Mash"
  end

  it "" do
    @mash.name = "My Mash"
    expect(@mash.name?).to be_true
  end
end

describe Hashies::Mash do
  before do
    @mash = Hashies::Mash.new
  end

  it "!" do
    @mash.author!.name = "Michael Bleigh"
    expect(@mash.author.name).to eq "Michael Bleigh"
  end
end

describe Hashies::Mash do
  before do
    @mash = Hashies::Mash.new
  end

  it "" do
    expect(@mash.author_). to be_nil
    @mash.author!

    expect(@mash.author_).to be_true
    expect(@mash.author_.name?).to be_false
  end
end
