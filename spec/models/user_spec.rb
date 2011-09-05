require 'spec_helper'

describe User do
  describe "#avatar" do
    it "assigns avatar to user" do
      user = Factory(:user, :avatar => File.open('spec/support/image.jpg'))
      user.avatar.to_s.should == "/uploads/user/avatar/#{user.id}/image.jpg"
    end
  end
end
