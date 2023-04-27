json.extract! task, :id, :tittle, :description, :start_date, :end_date, :result, :finished, :created_at, :updated_at
json.url task_url(task, format: :json)
