class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string     :title
      t.text       :text
      t.timestamp  :deleted_at
      t.references :user,       index:  true
      t.references :comment,    index:  true
      t.references :story,      index:  true

      t.timestamps
    end
  end
end
