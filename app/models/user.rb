class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :movies
  has_many :rentings
  has_many :reviews
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  # mount_uploader :avatar, PhotoUploader
  include PgSearch
  multisearchable against: [ :username ]
end
