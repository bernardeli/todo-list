class Lists::TasksController < InheritedResources::Base
  before_filter :authenticate_user!
  belongs_to :list
  respond_to :js, :only => [:done, :undone]

  def done
    resource.done!
  end

  def undone
    resource.undone!
  end
end
