require 'spec_helper'

describe Lists::TasksController do
  before(:each) { sign_in Factory(:user) }
  let(:task) { Factory :task }

  context "PUT done" do
    it "responses to js" do
      xhr :put, :done, :list_id => task.list.id, :id => task.id
      response.content_type.should == 'text/javascript'
    end
  end

  context "PUT undone" do
    it "responses to js" do
      xhr :put, :undone, :list_id => task.list.id, :id => task.id
      response.content_type.should == 'text/javascript'
    end
  end
end
