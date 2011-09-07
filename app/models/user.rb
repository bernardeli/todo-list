class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar, :name

  validates_presence_of :name

  has_many :lists, :dependent => :destroy
  has_many :watches, :dependent => :destroy

  scope :lasts_signed_in, order('current_sign_in_at DESC')

  mount_uploader :avatar, AvatarUploader
end
