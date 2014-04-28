json.array!(@tasks) do |task|
  json.extract! task, :id, :scenario_id, :deployment_id, :user_id, :completed
  json.url task_url(task, format: :json)
end
