class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :votes, foreign_key: :voter_id

  has_many :answered_questions, through: :answers, source: :question
  has_many :answers_commented_on, through: :comments, source: :answer

  has_many :questions_voted_on, through: :votes, source: :questions
  has_many :answers_voted_on, through: :votes, source: :answers
  has_many :comments_voted_on, through: :votes, source: :comments
end
