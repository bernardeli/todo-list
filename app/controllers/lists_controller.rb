class ListsController < InheritedResources::Base
  before_filter :authenticate_user!

  def new
    @list = List.new
    @list.tasks.build
  end

  protected

  def begin_of_association_chain
    current_user
  end
end
