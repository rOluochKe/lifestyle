class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :category
      t.integer :priority

      t.timestamps
    end
  end
end
