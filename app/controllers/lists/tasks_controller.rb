class Lists::TasksController < InheritedResources::Base
  respond_to :js, :only => [:done, :undone]

  def done
    resource.done!
  end

  def undone
    resource.undone!
  end

  protected

  def begin_of_association_chain
    @list ||= List.find params[:list_id]
  end
end
