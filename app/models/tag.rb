class Tag < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :tagged_questions
  has_many :questions, through: :tagged_questions
end
