class Tag < ActiveRecord::Base
  has_many :tagged_questions
  has_many :questions, through: :tagged_questions
end
