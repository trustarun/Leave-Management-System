class User < ActiveRecord::Base
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor   :first_name, :last_name
  has_many :subordinates, :class_name => "User"
  belongs_to :manager, :class_name => "User", :foreign_key => "manager_id"
  belongs_to :role
  has_many :leaves
  has_many :leaves_to_approve, :class_name => "Leave", :foreign_key => "manager_id"
  validates :email, :first_name, :last_name, :password, :presence => true

  def full_name
    self.first_name
  end
  
end
