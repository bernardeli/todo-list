class ListsController < InheritedResources::Base
  before_filter :authenticate_user!

  def create
    create! { lists_path }
  end

  def update
    update! { lists_path }
  end

  protected

  def begin_of_association_chain
    @current_user
  end
end
