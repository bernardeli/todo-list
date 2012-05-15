require 'spec_helper'

describe Task do
  it { should belong_to :list }
  it { should validate_presence_of :description }

  describe "#done!" do
    it "sets task as done" do
      task = FactoryGirl.create(:task)
      task.done!
      task.done.should be_true
    end
  end

  describe "#undone!" do
    it "sets task as undone" do
      task = FactoryGirl.create(:task, :done => true)
      task.undone!
      task.done.should be_false
    end
  end
end
