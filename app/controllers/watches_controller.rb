class WatchesController < InheritedResources::Base
  before_filter :authenticate_user!
  actions :index, :create, :destroy

  protected

  def begin_of_association_chain
    current_user
  end
end
