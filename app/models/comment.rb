class Comment < ActiveRecord::Base
  validates :author, presence: true
  validates :answer, presence: true

  belongs_to :author, class_name: User
  belongs_to :answer

  has_many :votes, as: :votable
  has_many :voters, through: :votes

  def upvotes
    self.votes.select{|vote| vote.upvote}
  end

  def downvotes
    self.votes.select{|vote| !vote.upvote}
  end

  def vote_count
    upvotes.size - downvotes.size
  end
end
