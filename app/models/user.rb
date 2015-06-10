class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :posts, foreign_key: :author_id
  has_many :comments

  validates :email, :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :email, format: { with: /.+@.+\..+/, message: "must be an email address" }, uniqueness: true
  validates :password, confirmation: true
  validates :password, :password_confirmation, presence: { on: :create }
end
