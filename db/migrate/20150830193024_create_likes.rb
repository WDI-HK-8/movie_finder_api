class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :omdb_id
      t.string :title
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
