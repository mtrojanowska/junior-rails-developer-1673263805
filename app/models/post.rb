class Post < ApplicationRecord
  belongs_to :author

  has_many :categories_posts
  has_many :categories, through: :categories_posts

  validates_associated :categories
  validates :categories, presence: true, on: :create

  validates :title, :description, :published_at, presence: true
end
