class FixNullFalseOnTable < ActiveRecord::Migration
  def change
    add_column :buildings, :description, :string
    change_column :buildings, :street_address, :string, null: false
    change_column :buildings, :city, :string, null: false
    change_column :buildings, :state, :string, null: false
    change_column :buildings, :postal_code, :integer, null: false
  end
end
