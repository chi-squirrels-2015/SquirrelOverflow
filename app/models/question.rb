class Question < ActiveRecord::Base
  scope :recent, -> { order("created_at DESC").limit(10) }

  belongs_to :author, class_name: User
  has_many :answers

  belongs_to :best_answer, class_name: Answer

  has_many :votes, as: :votable
  has_many :voters, through: :votes

  def vote_count
    self.votes.size
  end
end
