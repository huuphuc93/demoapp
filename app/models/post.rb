class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  has_many :bookmarks
  has_many :bookmark_users, through: :book_marks, source: :user

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(", ")
  end
end
