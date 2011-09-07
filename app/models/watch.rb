class Watch < ActiveRecord::Base
  belongs_to :watcher, :class_name => 'User', :foreign_key => "user_id"
  belongs_to :watched_list, :class_name => 'List', :foreign_key => "list_id"
end
