require 'spec_helper'

describe List do
  it { should validate_presence_of :name }
  it { should belong_to :user }
  it { should have_many :tasks }
end
