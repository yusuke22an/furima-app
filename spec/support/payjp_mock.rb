module PayjpMock
  def self.prepare_customer_information # Payjp::Customerのレスポンスモック
    {
      "id": "cus_e508f846181f5491fba3ee02692d",
      "cards": {
        "count":1,
        "data":[{
          "id": "car_bf3087b2da1e4bdc6d3188f3b709",
          "address_city": nil,
          "address_line1":nil,
          "address_line2":nil,
          "address_state":nil,
          "address_zip":nil,
          "address_zip_check": "unchecked",
          "brand": "Visa",
          "country":nil,
          "created": 1223830630,
          "customer": "cus_e508f846181f5491fba3ee02692d",
          "cvc_check": "passed",
          "exp_month":02,
          "exp_year":2022,
          "fingerprint": "e1d8225886e3a7211127df751c86787f",
          "last4": "4242",
          "livemode":false,
          "metadata":{},
          "name":nil,
          "object": "card"
          }],
          "has_more":false,
          "object": "list",
          "url": "/v1/customers/cus_e508f846181f5491fba3ee02692d/cards"
        },
      "created": 1223830631,
      "default_card": "car_bf3087b2da1e4bdc6d3188f3b709",
      "description": nil,
      "email": nil,
      "livemode": false,
      "metadata": {},
      "object": "customer",
      "subscriptions": {
        "count":0,
        "data":[],
        "has_more":false,
        "object": "list",
        "url": "/v1/customers/cus_e508f846181f5491fba3ee02692d/subscriptions"
      }
    }
  end
end