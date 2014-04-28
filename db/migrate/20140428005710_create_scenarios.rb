class CreateScenarios < ActiveRecord::Migration
  def change
    create_table :scenarios do |t|
      t.string :name
      t.text :expected
      t.text :notes
      t.integer :priority
      t.integer :user_id
      t.integer :group_id
      t.integer :deployment_id

      t.timestamps
    end
  end
end
