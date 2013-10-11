class AddLastNameColumn < ActiveRecord::Migration
  def change
    add_column :buildings, :last_name_of_owner, :string
  end
end
