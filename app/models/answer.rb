class Answer < ActiveRecord::Base
  belongs_to :author, class_name: User
  belongs_to :question
  has_many :comments

  has_many :votes, as: :votable
  has_many :voters, through: :votes

  def vote_count
    self.votes.size
  end
end
