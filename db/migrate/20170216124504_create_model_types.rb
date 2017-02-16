class CreateModelTypes < ActiveRecord::Migration
  def change
    create_table :model_types do |t|
      t.string :name
      t.string :model_type_slug
      t.integer :base_pirce
      t.integer :model_id

      t.timestamps null: false
    end
  end
end
