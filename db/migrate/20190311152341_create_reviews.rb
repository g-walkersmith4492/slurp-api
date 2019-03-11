class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :name, null: false
      t.string :type
      t.string :price
      t.integer :rating
      t.string :location
      t.string :review

      t.timestamps
    end
  end
end
