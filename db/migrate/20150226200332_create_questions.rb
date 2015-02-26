class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string  :title
      t.text    :content
      t.integer :author_id
      t.integer :best_answer_id

      t.timestamps null: false
    end
  end
end
