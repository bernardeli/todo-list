require 'spec_helper'

describe ApplicationHelper do
  describe "#active_class" do
    context "when path is current path" do
      before(:each) { helper.stub(:current_page?).and_return true }
      it "returns active" do
        helper.active_class(lists_path).should == "active"
      end
    end

    context "when path is not current path" do
      it "returns empty" do
        helper.active_class(lists_path).should == ""
      end
    end
  end
end
