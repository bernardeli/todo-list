require 'spec_helper'

describe ListsController do
  before :each do
    sign_in Factory(:user)
  end

  describe "#create" do
    it "redirects to index" do
      post :create, :list => { :name => 'First list', :private => false }
      response.should redirect_to lists_path
    end
  end
end
