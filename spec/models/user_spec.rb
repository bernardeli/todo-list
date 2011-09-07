require 'spec_helper'

describe User do
  it { should have_many :lists }
  it { should validate_presence_of :name }
  it { should have_many :watches }

  describe "#avatar" do
    it "assigns avatar to user" do
      user = Factory(:user, :avatar => File.open('spec/support/image.jpg'))
      user.avatar.to_s.should == "/uploads/user/avatar/#{user.id}/image.jpg"
    end
  end

  describe "#lists" do
    it "destroys lists when user is destroyed" do
      list = Factory :list
      user = list.user
      user.destroy
      List.count.should == 0
    end
  end

  describe "#watches" do
    it "destroys watches when user is destroyed" do
      watch = Factory :watch
      user = watch.user
      user.destroy
      Watch.count.should == 0
    end
  end

  describe "#lasts_signed_in" do
    it "returns last users signed in" do
      first_user = Factory(:user, :current_sign_in_at => Time.now - 1.hour)
      second_user = Factory(:user, :current_sign_in_at => Time.now)
      User.lasts_signed_in.should == [second_user, first_user]
    end
  end
end
