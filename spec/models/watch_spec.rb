require 'spec_helper'

describe Watch do
  it { should belong_to :list }
  it { should belong_to :user }
end
