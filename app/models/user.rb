class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :trucks
  has_many :truck_bookings, through: :trucks, :source => :bookings
  has_many :bookings
  mount_uploader :avatar, AvatarUploader
end
