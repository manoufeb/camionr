class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :trucks, dependent: :destroy
  has_many :truck_bookings, through: :trucks, :source => :bookings, dependent: :destroy
  has_many :bookings, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
end
