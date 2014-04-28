json.array!(@deployments) do |deployment|
  json.extract! deployment, :id, :name, :user_id, :project_id
  json.url deployment_url(deployment, format: :json)
end
