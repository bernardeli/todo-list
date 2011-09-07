class Task < ActiveRecord::Base
  belongs_to :list
  validates_presence_of :description

  def done!
    update_attribute(:done, true)
  end

  def undone!
    update_attribute(:done, false)
  end
end
