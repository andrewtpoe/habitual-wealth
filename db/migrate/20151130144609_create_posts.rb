class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :description
      t.string :main_image
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
