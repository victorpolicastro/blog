# == Schema information
#
# Table name: posts
#
# title                 :string      limit: 50
# description           :string      limit: 500
# body                  :string
# category_id           :integer
# created_at            :datetime
# updated_at            :datetime
# image_file_name       :string
# image_content_type    :string
# image_file_size       :integer
# image_updated_at      :datetime
# user_id               :integer
# slug                  :string
#
# Index
#
# index_posts_on_category_id
# index_posts_on_slug
# index_posts_on_user_id
#
class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: %i[slugged history]
  belongs_to :category, optional: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_attached_file :image, styles: { large: '500x300', medium: '300x150', thumb: '150x75' }
  validates_attachment_content_type :image, content_type: %r{ /\Aimage\/.*\z/ }
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }

  paginates_per 10

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
