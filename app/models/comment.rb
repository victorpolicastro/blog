class Comment < ApplicationRecord
  validates :body, presence: true, length: { maximum: 250 }
  belongs_to :post, dependent: :destroy
end
