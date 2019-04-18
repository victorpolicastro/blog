class Post < ApplicationRecord
  belongs_to :category, optional: true
  has_many :comments, dependent: :destroy
  has_attached_file :image, styles: { large: '500x300', medium: '300x150', thumb: '150x75' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }

  paginates_per 10
end
