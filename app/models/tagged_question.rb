class TaggedQuestion < ActiveRecord::Base
  validates_uniqueness_of :tag_id, scope: :question_id

  belongs_to :question
  belongs_to :tag
end
