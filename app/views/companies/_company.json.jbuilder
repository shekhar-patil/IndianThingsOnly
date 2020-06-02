json.extract! company, :id, :name, :description, :picture, :created_at, :updated_at
json.url company_url(company, format: :json)
