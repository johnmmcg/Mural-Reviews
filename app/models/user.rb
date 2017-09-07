class User < ApplicationRecord
  validates_presence_of :username
  has_many :murals
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end


# Does this not need :Base?
# Still need to add admin vs member
# Incorporate factory girl
