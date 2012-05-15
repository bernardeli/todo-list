require 'spec_helper'

describe User do
  it { should have_many :lists }
  it { should validate_presence_of :name }
  it { should have_many :watches }

  describe "#avatar" do
    it "assigns avatar to user" do
      user = FactoryGirl.create(:user, :avatar => File.open('spec/support/image.jpg'))
      user.avatar.to_s.should == "/uploads/user/avatar/#{user.id}/image.jpg"
    end
  end

  describe "#lists" do
    it "destroys lists when user is destroyed" do
      list = FactoryGirl.create :list
      user = list.user
      user.destroy
      List.count.should == 0
    end
  end

  describe "#watches" do
    it "destroys watches when user is destroyed" do
      watch = FactoryGirl.create :watch
      user = watch.user
      user.destroy
      Watch.count.should == 0
    end
  end

  describe "#lasts_signed_in" do
    it "returns last users signed in" do
      first_user = FactoryGirl.create(:user, :current_sign_in_at => Time.now - 1.hour)
      second_user = FactoryGirl.create(:user, :current_sign_in_at => Time.now)
      User.lasts_signed_in.should == [second_user, first_user]
    end
  end

  describe "#watch" do
    it "returns the related watch object" do
      user = FactoryGirl.create(:user)
      list = FactoryGirl.create(:list)
      watch = FactoryGirl.create(:watch, :user => user, :list => list)
      user.watch(list).should == watch
    end
  end

  describe "#watch?" do
    context "when user is watching the list" do
      it "returns true" do
        user = FactoryGirl.create(:user)
        list = FactoryGirl.create(:list)
        watch = FactoryGirl.create(:watch, :user => user, :list => list)
        user.watch?(list).should be_true
      end
    end

    context "when user is not watching the list" do
      it "returns false" do
        user = FactoryGirl.create(:user)
        list = FactoryGirl.create(:list)
        watch = FactoryGirl.create(:watch)
        user.watch?(list).should be_false
      end
    end
  end
end
