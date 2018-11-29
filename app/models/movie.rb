class Movie < ApplicationRecord
  belongs_to :user
  has_many :rentings
  has_many :reviews
  mount_uploader :cover, PhotoUploader
  validates :title, presence: true
  validates :release_date, presence: true
  validates :duration, presence: true
  validates :description, presence: true
  validates :director, presence: true
  validates :cover, presence: true
  validates :price, presence: true
  validates :rating, presence: true
  include PgSearch
  multisearchable against: [:title, :description, :director, :category]
end
