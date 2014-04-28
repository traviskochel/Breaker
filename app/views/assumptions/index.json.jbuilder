json.array!(@assumptions) do |assumption|
  json.extract! assumption, :id, :instruction, :scenario_id
  json.url assumption_url(assumption, format: :json)
end
