class DefaultValueForAdminFieldToUser < ActiveRecord::Migration
  def up
  end

  def down
  end
  def change
    change_column :users, :admin, :boolean, default: false
  end
end
