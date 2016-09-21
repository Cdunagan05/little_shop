class ChangeItem < ActiveRecord::Migration[5.0]
  def change
    image = 'http://www.thesportscol.com/wp-content/uploads/2015/04/college_sports_minute.jpg'
    change_column :items, :image, :string, default: image
  end
end
