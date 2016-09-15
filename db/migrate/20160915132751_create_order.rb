class CreateOrder < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true

      #What do orders have? (set up route and controller for Order)

      t.timestamps null: false
    end
  end
end
