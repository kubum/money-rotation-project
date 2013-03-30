json.id @record.id
json.comment @record.comment
json.amount @record.amount
json.date @record.created_at.to_formatted_s(:db)
json.flow @record.flow