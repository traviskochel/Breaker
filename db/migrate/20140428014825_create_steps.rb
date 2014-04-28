class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :instruction
      t.string :type
      t.integer :scenario_id

      t.timestamps
    end
  end
end
