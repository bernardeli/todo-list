require 'spec_helper'

describe Task do
  it { should belong_to :list }

  describe "#done!" do
    it "sets task as done" do
      task = Factory(:task)
      task.done!
      task.done.should be_true
    end
  end

  describe "#undone!" do
    it "sets task as undone" do
      task = Factory(:task, :done => true)
      task.undone!
      task.done.should be_false
    end
  end
end
