class PostCategory < ApplicationRecord
  belongs_to :post, dependent: :destroy
  belongs_to :category, dependent: :destroy
end
