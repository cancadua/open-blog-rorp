class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :content
      t.integer :post_id

      t.timestamps
    end
    add_index :comments, :post_id
  end
end
