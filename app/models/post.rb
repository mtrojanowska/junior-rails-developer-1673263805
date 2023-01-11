class Post < ApplicationRecord
  belongs_to :author

  validates :title, :description, :published_at, presence: true
end
