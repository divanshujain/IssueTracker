json.array!(@issues) do |issue|
  json.extract! issue, :id, :title, :body, :project_id
  json.url issue_url(issue, format: :json)
end
