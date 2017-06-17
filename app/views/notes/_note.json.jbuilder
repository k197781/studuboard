json.extract! note, :id, :content, :studentType, :subject, :created_at, :updated_at
json.url note_url(note, format: :json)