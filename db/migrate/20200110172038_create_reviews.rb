class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.belongs_to :user, index: true
      t.belongs_to :product, index: true
      t.integer :star_rating
      t.string :comment

      t.timestamps
    end
  end
end
