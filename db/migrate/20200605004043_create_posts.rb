class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :date
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
