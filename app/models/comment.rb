class Comment < ApplicationRecord
  belongs_to :post
  scope :actual, -> {}
end
