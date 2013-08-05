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

  it "" do
    c = Hashies::Clash.new
    c.where!.abc('def').ghi(123)._end!.order(:created_at)
    expect(c).to eq({where: {:abc => 'def', :ghi => 123}, order: :created_at})
  end

  it "" do
    c = Hashies::Clash.new
    c.where(:abc => 'def').where(:hgi => 123)
    puts c.inspect
    expect(c).to eq ({where: {:abc => 'def', :hgi => 123}})
  end
end
