require 'spec_helper'

describe Hashies::Trash do
  before do
    class PersonTwo < Hashies::Trash
      property :first_name, :from => :firstName
    end
  end
end
