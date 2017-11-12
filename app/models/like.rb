class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :post, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :post }

  after_create :destroy_dislike

scope :hot, -> {
  joins(:post).select(:post_id).group("likes.post_id").order("count(*) DESC").limit(5)
}

  private

  def destroy_dislike
    dislike = Dislike.find_by user_id: self.user_id, post_id: self.post_id
    return if dislike.nil?
    dislike.destroy
  end
end
