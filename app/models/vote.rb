class Vote < ActiveRecord::Base
  validates :voter, presence: true
  validates :votable, presence: true

  belongs_to :votable, polymorphic: true
  belongs_to :voter, class_name: User

  def type
    if self.upvote
      "upvote"
    else
      "downvote"
    end
  end
end
