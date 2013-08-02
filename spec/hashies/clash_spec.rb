require 'spec_helper'

describe Hashies::Clash do
  before do
  end

  it "" do
    c = Hashies::Clash.new
    c.where(:abc => 'def').order(:created_at)
    # c # => {:where => {:abc => 'def'}, :order => :created_at}
    # valid_hash = {where: {abc: 'def'}, order: :created_at}
    # expect(c).to eql(valid_hash)

    expect(c).to eq({where:  {:abc => 'def'}, order: :created_at})
    # puts c.where
  end
end