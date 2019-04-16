class Post < ApplicationRecord
  has_attached_file :image, styles: { large: '500x300', medium: '300x150', thumb: '150x75' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 500 }

  paginates_per 10

  belongs_to :category
end
