class AddReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id,       null: false
      t.integer :restroom_id,   null: false
      t.integer :cleanliness
      t.integer :privacy
      t.integer :smell
      t.string :accessibility
      t.string :gender
      t.text :comments

      t.timestamps
    end
  end
end
