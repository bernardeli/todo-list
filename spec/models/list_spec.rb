require 'spec_helper'

describe List do
  it { should validate_presence_of :name }
  it { should belong_to :user }
  it { should have_many :tasks }

  describe "#tasks" do
    it "destroys tasks when list is destroyed" do
      task = Factory(:task)
      list = task.list
      list.destroy
      Task.count.should == 0
    end
  end

  describe "nested attributes" do
    context "when parameters are filled in" do
      it "accepts nested attributes for tasks" do
        list = List.new(:name => 'list', :user => Factory(:user), :private => true, :tasks_attributes => { "0" => { :description => "Task1" } })
        list.save
        list.tasks.first.description == 'Task1'
      end
    end

    context "when parameters are not filled in" do
      it "rejects nested attributes for tasks" do
        list = List.new(:name => 'list', :user => Factory(:user), :private => true, :tasks_attributes => { "0" => { :description => "" } })
        list.save
        list.tasks.should be_empty
      end
    end
  end

  describe ".public" do
    it "returns only public lists" do
      public_lists = 2.times.map { Factory(:list, :private => false) }
      private_lists = 2.times.map { Factory(:list, :private => true) }
      List.public.all.should == public_lists
    end
  end
end
