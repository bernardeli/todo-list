require 'spec_helper'

describe ListsHelper do
  describe "#add_task_link" do
    it "returns link that adds a new task field" do
      list = Factory(:list)
      form = SimpleForm::FormBuilder.new(:list, list, self, {}, nil)
      helper.add_task_link(form).should do |link|
        link.should include 'onclick'
        link.should include 'tasks-fields'
        link.should include 'NEW_RECORD'
      end
    end
  end

  describe "#remove_task_link" do
    context "when object is new" do
      it "returns link that removes DOM from page" do
        list = Factory.build :list
        form = SimpleForm::FormBuilder.new(:list, list, self, {}, nil)
        helper.remove_task_link(form).should do |link|
          link.should include 'Remove'
          link.should include 'onclick'
          link.should_not include 'delete'
        end
      end
    end

    context "when object is persisted" do
      it "returns link that sets _destroy value to true" do
        list = Factory :list
        form = SimpleForm::FormBuilder.new(:list, list, self, {}, nil)
        helper.remove_task_link(form).should do |link|
          link.should include 'Remove'
          link.should include 'onclick'
          link.should include 'delete'
          link.should include 'hide'
        end
      end
    end
  end
end
