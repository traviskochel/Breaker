class CreatePrereqs < ActiveRecord::Migration
  def change
    remove_column :steps, :type
    
    create_table :prereqs do |t|
      t.string :instruction
      t.integer :scenario_id

      t.timestamps
    end
  end
end
