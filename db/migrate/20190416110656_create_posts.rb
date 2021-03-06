class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, limit: 50
      t.string :description, limit: 500
      t.text :body
      t.references :category, foreign_key: true
      
      t.timestamps
    end
  end
end
