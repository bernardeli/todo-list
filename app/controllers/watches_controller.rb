class WatchesController < InheritedResources::Base
  before_filter :authenticate_user!
  actions :index, :create, :destroy
  respond_to :html, :json

  def create
    create! { user_list_path(resource.list.user.id, resource.list_id) }
  end

  protected

  def begin_of_association_chain
    current_user
  end
end
