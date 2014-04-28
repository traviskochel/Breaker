class RenamePrereqsToAssumptions < ActiveRecord::Migration
  def change
    rename_table :prereqs, :assumptions
  end
end
