class Vote < ActiveRecord::Base
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
