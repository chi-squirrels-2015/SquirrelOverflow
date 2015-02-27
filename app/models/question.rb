class Question < ActiveRecord::Base
  scope :recent, -> { order("created_at DESC").limit(10) }

  belongs_to :author, class_name: User
  has_many :answers

  belongs_to :best_answer, class_name: Answer

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
