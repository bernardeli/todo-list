require 'spec_helper'

describe Users::ListsController do
  let(:user) { FactoryGirl.create :user }
  before(:each) { sign_in user }

  context "GET show" do
    it "redirects to watches path if list is private" do
      list = FactoryGirl.create(:list, :private => true, :user => user)
      get :show, :id => list.id, :user_id => user.id
      response.should redirect_to watches_path
    end
  end
end
