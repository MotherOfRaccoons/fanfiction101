class Post < ApplicationRecord
  has_many :comments
  validates :title, presence: true,
                    length: { minimum: 5, maximum: 50 }
  validates :synopsis, presence: true,
                       length: { minimum: 20, maximum: 500 }
end
