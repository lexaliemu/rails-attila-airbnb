class Movie < ApplicationRecord
  belongs_to :user
  has_many :rentings
  mount_uploader :cover, PhotoUploader
  include PgSearch
  multisearchable against: [:title, :description, :director, :category]
end
