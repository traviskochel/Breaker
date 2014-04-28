json.array!(@scenarios) do |scenario|
  json.extract! scenario, :id, :name, :expected, :notes, :priority, :user_id, :group_id, :deployment_id
  json.url scenario_url(scenario, format: :json)
end
