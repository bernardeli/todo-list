class Users::ListsController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :check_list_accessibility, :only => :show
  belongs_to :user
  actions :index, :show

  protected

  def collection
    @lists ||= end_of_association_chain.public
  end

  private

  def check_list_accessibility
    redirect_to watches_path if resource.private?
  end
end
