class FixBasePrice < ActiveRecord::Migration
  def change
    rename_column :model_types, :base_pirce, :base_price
  end
end
