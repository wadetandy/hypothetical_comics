class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :text
      t.string :title
      t.timestamp :deleted_at
      t.references :user, index: true

      t.timestamps
    end
  end
end
