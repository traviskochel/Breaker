class CreatePrereqs < ActiveRecord::Migration
  def change
    
    create_table :prereqs do |t|
      t.string :instruction
      t.integer :scenario_id

      t.timestamps
    end
  end
end
