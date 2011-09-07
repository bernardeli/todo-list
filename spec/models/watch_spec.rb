require 'spec_helper'

describe Watch do
  it { should belong_to :watcher }
  it { should belong_to :watched_list }
end
