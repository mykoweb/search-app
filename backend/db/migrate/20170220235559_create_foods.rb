class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :category_id

      t.timestamps
    end

    add_index :foods, :category_id
    add_index :foods, :name
  end
end
