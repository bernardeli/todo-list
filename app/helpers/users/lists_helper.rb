module Users::ListsHelper
  def link_to_watch(list)
    if current_user.watch?(list)
      link_to "Unwatch", watch_path(current_user.watch(list)), :method => :delete, :confirm => "Are you sure?", :title => "Unwatch"
    else
      link_to "Watch", watches_path(:watch => { :list_id => list.id }), :method => :post, :title => "Watch"
    end
  end
end
