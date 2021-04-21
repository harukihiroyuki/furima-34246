class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :category_id
      t.integer :item_condition_id
      t.integer :tax_id
      t.integer :prefecture_id
      t.integer :send_day_id
      t.integer :price
      t.references :user, foreign_key: true
      t.text :text
      t.timestamps
    end
  end
end


