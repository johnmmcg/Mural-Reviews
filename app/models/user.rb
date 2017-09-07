class User < ApplicationRecord
  validates_presence_of :username
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end


# Can't get link_to to work
# Does this not need :Base?
# Still need to add admin vs member
# Incorporate factory girl
