class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
      t.string :name
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
