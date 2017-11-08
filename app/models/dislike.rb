class Dislike < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :post, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :post }

  after_create :like_dislike

  private

  def like_dislike
    like = Like.find_by user_id: self.user_id, post_id: self.post_id
    return if like.nil?
    like.destroy
  end
end
