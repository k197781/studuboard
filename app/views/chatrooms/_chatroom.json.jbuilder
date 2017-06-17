json.extract! chatroom, :id, :title, :subject, :created_at, :updated_at
json.url chatroom_url(chatroom, format: :json)