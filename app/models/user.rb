class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable 

  belongs_to :role
  has_one :profile
  has_many :orders

  validates :first_name,:last_name, :phone_no,   presence: true
  validates :phone_no, numericality: true


  def is_admin
  	self.role.name == 'Admin'
  end  

  def is_dietitian
  	self.role.name == 'Dietitian'
  end 

  def is_client
  	self.role.name == 'Client'
  end 

  def self.new_users
    where('created_at >= ?', 1.week.ago).count
  end 

  def full_name
    unless (self.first_name.blank? || self.last_name.blank?)
      self.first_name + ' ' + self.last_name
    end  
  end  

end
