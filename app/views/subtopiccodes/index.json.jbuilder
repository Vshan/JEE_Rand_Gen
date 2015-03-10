json.array!(@subtopiccodes) do |subtopiccode|
  json.extract! subtopiccode, :id, :stcode, :stname, :topiccode_id, :active
  json.url subtopiccode_url(subtopiccode, format: :json)
end
