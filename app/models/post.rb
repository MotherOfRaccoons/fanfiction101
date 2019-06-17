class Post < ApplicationRecord
  paginates_per 5
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5, maximum: 50 }
  validates :synopsis, presence: true,
                       length: { minimum: 20, maximum: 5000 }
end
