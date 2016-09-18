class CreateOrder < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
