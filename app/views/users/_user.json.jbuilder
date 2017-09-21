json.extract! user, :id, :nombre, :direccion, :telefono, :correo, :campo, :zona, :created_at, :updated_at
json.url user_url(user, format: :json)
