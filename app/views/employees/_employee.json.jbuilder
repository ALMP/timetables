json.extract! employee, :id, :name, :code, :created_at, :updated_at
json.url employee_url(employee, format: :json)
