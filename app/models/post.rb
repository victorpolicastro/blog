class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  belongs_to :category, optional: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_attached_file :image, styles: { large: '500x300', medium: '300x150', thumb: '150x75' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }

  paginates_per 10

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
