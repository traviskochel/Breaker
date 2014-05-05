crumb :projects do
  link "Projects", projects_path
end

crumb :project do |project|
  link project.name, project_path(project)
  parent :projects
end

crumb :project_edit do |project|
  link "Edit", edit_project_path(project)
  parent :project , project
end

crumb :deployment do |deployment|
  link 'Deployment: ' +  deployment.name, deployment_path(deployment)
  parent :project , deployment.project
end

crumb :scenario do |scenario|
  link scenario.name, scenario_path(scenario)
  parent :project_edit , scenario.group.project
end

crumb :scenario_edit do |scenario|
  link scenario.name , edit_scenario_path(scenario)
  parent :project_edit , scenario.group.project
end

crumb :task do |task|
  link task.scenario.name, task_path(task)
  parent :deployment , task.deployment
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).