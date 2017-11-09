class Dislike < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :post, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :post }

  after_create :destroy_like

  private

  def destroy_like
    like = Like.find_by user_id: self.user_id, post_id: self.post_id
    return if like.nil?
    like.destroy
  end
end
