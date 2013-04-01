json.array! @records do |record|
  json.array! [(record.created_at.to_f * 1000.0).to_i, record.amount]
end