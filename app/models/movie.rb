class Movie < ApplicationRecord
  belongs_to :user
  has_many :rentings
  mount_uploader :cover, PhotoUploader
end
