class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :city, foreign_key: true
      t.text :title
      t.text :content

      t.timestamps
    end
  end
end
