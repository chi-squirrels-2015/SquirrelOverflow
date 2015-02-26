class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text       :content
      t.integer    :author_id
      t.references :answer

      t.timestamps null: false
    end
  end
end
