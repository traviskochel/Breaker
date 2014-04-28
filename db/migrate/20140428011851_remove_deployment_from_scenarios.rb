class RemoveDeploymentFromScenarios < ActiveRecord::Migration
  def change
    remove_column :scenarios, :deployment_id
  end
end
