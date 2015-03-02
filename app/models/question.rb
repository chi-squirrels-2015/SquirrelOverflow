class Question < ActiveRecord::Base
  scope :recent, -> { order("created_at DESC").limit(10) }

  validates :author, presence: true

  belongs_to :author, class_name: User
  has_many :answers

  belongs_to :best_answer, class_name: Answer

  has_many :votes, as: :votable
  has_many :voters, through: :votes

  has_many :tagged_questions
  has_many :tags, through: :tagged_questions

  def self.search(search)
    if search
      query = Tag.find_by_name(search)
      if query
        @questions = query.questions
      else
        @questions = []
      end
    else
      @questions = Question.recent
    end
  end

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
