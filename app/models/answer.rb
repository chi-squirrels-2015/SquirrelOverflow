class Answer < ActiveRecord::Base
  validates :author, presence: true
  validates :question, presence: true

  belongs_to :author, class_name: User
  belongs_to :question
  has_many :comments

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
