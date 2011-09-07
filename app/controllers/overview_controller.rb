class OverviewController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.lasts_signed_in.limit(10)
  end
end
