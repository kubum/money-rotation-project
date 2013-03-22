json.array! @records do |record|
  json.comment record.comment
  json.amount record.amount
end