class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :public_name
      t.integer :organization_type
      t.integer :pricing_policy

      t.timestamps null: false
    end
  end
end
