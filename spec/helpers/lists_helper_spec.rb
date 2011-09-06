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
end
