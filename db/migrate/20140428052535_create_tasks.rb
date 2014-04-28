class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :scenario_id
      t.integer :deployment_id
      t.integer :user_id
      t.boolean :completed

      t.timestamps
    end
  end
end
