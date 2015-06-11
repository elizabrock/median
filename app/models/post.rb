class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  def normalize_friendly_id(title)
    super.gsub("-", "_")
  end

  belongs_to :author, class_name: "User"
  has_many :comments

  validates :author, :body, :title, presence: true
end
