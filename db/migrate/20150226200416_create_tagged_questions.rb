class CreateTaggedQuestions < ActiveRecord::Migration
  def change
    create_table :tagged_questions do |t|
      t.references :tags
      t.references :question

      t.timestamps null: false
    end
  end
end
