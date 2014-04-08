object @document

attributes :id, :name

child :drafts do
  attributes :id, :document_id, :content
end