# == Schema Information
#
# Table name: comments
#
# post_id         :integer
# body            :string     limit: 250
# created_at      :datetime
# updated_at      :datetime
# user_id         :integer
#
# Index
#
# index_comments_on_post_id
# index_comments_on_user_id
#
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :body, presence: true, length: { maximum: 250 }
end
