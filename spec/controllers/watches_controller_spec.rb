require 'spec_helper'

describe WatchesController do
  let(:user) { Factory(:user) }
  before(:each) { sign_in user }

  context "POST create" do
    it "redirects to user list path" do
      list = Factory(:list, :user => user)
      post :create, :watch => { :user_id => user.id, :list_id => list.id }
      response.should redirect_to user_list_path(user.id, list.id)
    end
  end
end
