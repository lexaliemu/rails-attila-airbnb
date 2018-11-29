class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :user_id, presence: true
  validates :movie_id, presence: true
  validates :date_comment, presence: true
  validates :content, presence: true
end
