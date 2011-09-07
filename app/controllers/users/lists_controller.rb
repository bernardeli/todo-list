class Users::ListsController < InheritedResources::Base
  before_filter :authenticate_user!
  belongs_to :user
  actions :index, :show

  protected

  def collection
    @lists ||= end_of_association_chain.public
  end
end
