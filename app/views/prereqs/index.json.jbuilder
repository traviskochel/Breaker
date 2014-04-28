json.array!(@prereqs) do |prereq|
  json.extract! prereq, :id, :instruction, :scenario_id
  json.url prereq_url(prereq, format: :json)
end
