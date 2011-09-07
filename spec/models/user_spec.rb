require 'spec_helper'

describe User do
  it { should have_many :lists }
  it { should validate_presence_of :name }
  it { should have_many :watches }
  it { should have_many(:watched_lists).through(:watches) }

  describe "#avatar" do
    it "assigns avatar to user" do
      user = Factory(:user, :avatar => File.open('spec/support/image.jpg'))
      user.avatar.to_s.should == "/uploads/user/avatar/#{user.id}/image.jpg"
    end
  end
end
