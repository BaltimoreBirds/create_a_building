class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :buildings, :last_name_of_owner, :string
  end
end
