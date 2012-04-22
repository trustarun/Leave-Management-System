class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :subordinates, :class_name => "User"
  belongs_to :manager, :class_name => "User", :foreign_key => "manager_id"
  belongs_to :role
  has_many :leaves
  has_many :leaves_to_approve, :class_name => "Leave", :foreign_key => "manager_id"
  validates :email, :first_name, :last_name, :password, :confirm_password, :presence => true
  
end
