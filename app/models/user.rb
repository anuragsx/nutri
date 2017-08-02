class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable 

  belongs_to :role
  has_one :profile

  def is_admin
  	self.role.name == 'Admin'
  end  

  def is_dietitian
  	self.role.name == 'Dietitian'
  end 

    def is_client
  	self.role.name == 'Client'
  end  

end
