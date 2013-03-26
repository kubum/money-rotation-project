json.array! @records do |record|
  json.id record.id
  json.comment record.comment
  json.amount record.amount
  json.flow record.flow
end