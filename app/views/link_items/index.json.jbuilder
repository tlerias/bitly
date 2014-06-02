json.array!(@link_items) do |link_item|
  json.extract! link_item, :id, :original_url, :short_name, :password, :needs_email
  json.url link_item_url(link_item, format: :json)
end
