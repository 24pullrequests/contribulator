JSONAPI.configure do |config|
  config.json_key_format = :underscored_key

  config.operations_processor = :counting_active_record

  # Pagination
  config.default_paginator = :paged
  config.default_page_size = 50
  config.maximum_page_size = 100
end
