class AddUserTypesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :beta, :boolean, default: false
  end
end
