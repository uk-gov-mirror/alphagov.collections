require 'active_model'

class Document
  include ActiveModel::Model

  attr_accessor(
    :base_path,
    :change_note,
    :content_store_document_type,
    :description,
    :format,
    :organisations,
    :public_updated_at,
    :title,
  )
end
