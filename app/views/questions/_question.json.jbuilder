json.extract! question, :id, :text, :no_value, :yes_value, :block_id, :created_at, :updated_at
json.url question_url(question, format: :json)
