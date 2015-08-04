json.array!(@orders) do |order|
  json.extract! order, :id, :name, :adres, :pay_type, :email
  json.url order_url(order, format: :json)
end
