require 'spec_helper'

describe Restaurant do
  it { should belong_to :user }
  it { should have_many :reviews }
end
