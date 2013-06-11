class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :post_type
      t.string :image_extension
      t.text :tags

      t.timestamps
    end
  end
end
