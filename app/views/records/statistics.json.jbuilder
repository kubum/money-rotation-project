json.income do
  json.array! @income do |record|
    json.array! [(record.created_at.to_f * 1000.0).to_i, record.amount]
  end
end

json.expense do
  json.array! @expense do |record|
    json.array! [(record.created_at.to_f * 1000.0).to_i, record.amount]
  end
end