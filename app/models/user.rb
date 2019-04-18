class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_attached_file :avatar, styles: { large: '500x300', medium: '300x150', thumb: '150x75' }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
end
