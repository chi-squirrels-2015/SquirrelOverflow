class Comment < ActiveRecord::Base
  belongs_to :author, class_name: User
  belongs_to :answer

  has_many :votes, as: :votable
  has_many :voters, through: :votes

  def vote_count
    self.votes.size
  end
end
