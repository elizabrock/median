class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :posts, foreign_key: :author_id

  validates :email, :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :email, format: { with: /.+@.+\..+/, message: "must be an email address" }, uniqueness: true
  validates :password, confirmation: true
  validates :password, :password_confirmation, presence: { on: :create }
  validates :twitter_id
  validates :twitter_username

  def self.find_for_twitter_oauth(auth)
    where(auth.slice(:provider, :uid, :nickname)).first_or_create do |user|
      user.provider = auth.provider
      user.twitter_id = auth.uid
      user.twitter_username = "@#{auth.info.nickname}"
  end

end
