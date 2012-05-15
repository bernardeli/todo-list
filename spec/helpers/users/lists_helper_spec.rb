require 'spec_helper'

describe Users::ListsHelper do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    controller.stub(:current_user).and_return(user)
  end

  describe "#link_to_watch" do
    context "when current_user watchs the related list" do
      it "returns a link to unwatch the list" do
        list = FactoryGirl.create(:list, :user => user)
        watch = FactoryGirl.create(:watch, :user => user, :list => list)
        helper.link_to_watch(list).should include 'Unwatch'
      end
    end

    context "when current_user does not watch the related list" do
      it "returns a link to watch the list" do
        list = FactoryGirl.create(:list, :user => user)
        helper.link_to_watch(list).should include 'Watch'
      end
    end
  end
end
