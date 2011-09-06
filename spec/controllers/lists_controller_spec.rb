require 'spec_helper'

describe ListsController do
  before :each do
    sign_in Factory(:user)
  end

  context "POST create" do
    it "redirects to index" do
      post :create, :list => { :name => 'First list', :private => false }
      response.should redirect_to lists_path
    end
  end

  context "PUT update" do
    it "redirects to index" do
      list = Factory :list
      put :update, { :id => list.id, :list => { :name => 'Updated list', :private => true } }
      response.should redirect_to lists_path
    end
  end
end
