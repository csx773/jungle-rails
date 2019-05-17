json.extract! usertest, :id, :name, :email, :login, :created_at, :updated_at
json.url usertest_url(usertest, format: :json)