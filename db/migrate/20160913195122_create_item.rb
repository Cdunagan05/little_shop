class CreateItem < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.float :price
      t.string :image
      t.timestamps null: false
    end
  end
end
