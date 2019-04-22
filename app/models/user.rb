# == Schema Information
#
# Table name: users
#
# name                      :string
# last_name                 :string
# email                     :string
# encrypted_password        :string
# reset_password_token      :string
# reset_password_sent_at    :datetime
# remember_created_at       :datetime
# created_at                :datetime
# updated_at                :datetime
# avatar_file_name          :string
# avatar_content_type       :string
# avatar_file_size          :integer
# avatar_updated_at         :datetime
# admin                     :boolean
#
# Index
#
# index_users_on_email
# index_users_on_reset_password_token
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_attached_file :avatar, styles: { large: '500x300', medium: '300x150', thumb: '150x75' }
  validates_attachment_content_type :avatar, content_type: %r{ /\Aimage\/.*\z/ }
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
end
