class List < ActiveRecord::Base
  has_many :tasks, :dependent => :destroy
  belongs_to :user
  validates_presence_of :name

  accepts_nested_attributes_for :tasks, :allow_destroy => true, :reject_if => :all_blank
end
