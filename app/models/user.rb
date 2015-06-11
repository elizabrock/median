class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :posts, foreign_key: :author_id

  validates :email, :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :email, format: { with: /.+@.+\..+/, message: "must be an email address" }, uniqueness: true
  validates :password, confirmation: true
  validates :password, :password_confirmation, presence: { on: :create }
  validates_uniqueness_of :twitter_id
  validates_uniqueness_of :twitter_nickname

  def update_with_twitter_oauth(auth)
      # self.provider = auth.provider
      self.twitter_id = auth.uid
      self.twitter_nickname = "@#{auth.info.nickname}"
      self.save
  end
end
