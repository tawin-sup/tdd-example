class AddModelTypeCodeToModelTypes < ActiveRecord::Migration
  def change
    add_column :model_types, :model_type_code, :string
  end
end
