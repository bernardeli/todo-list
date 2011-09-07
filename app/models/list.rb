class List < ActiveRecord::Base
  has_many :tasks, :dependent => :destroy
  has_many :watches, :dependent => :destroy
  belongs_to :user
  validates_presence_of :name

  accepts_nested_attributes_for :tasks, :allow_destroy => true, :reject_if => proc { |attr| attr['description'].blank? }

  scope :public, where(:private => false)
end
