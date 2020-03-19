module PayjpMock
  def self.prepare_customer_information # Payjp::Customerのレスポンスモック
    {
      "id": "cus_e508f846181f5491fba3ee02692d", #ここのidはなんでも良い mockのidだから。
      "cards": {
        "count":1,
        "data":[{
          "id":"car_c91aa7d8ec85573dd4b4fdcfb99c", #ここのidはデータなので、dbと同じでないといけない。
          "address_city":"",
          "address_line1":"",
          "address_line2":"",
          "address_state":"",
          "address_zip":"",
          "address_zip_check":"unchecked",
          "brand":"Visa",
          "country":"",
          "created":1584597777,
          "customer":"cus_8241fab179982d39cd973023a2e1",  #ここのidはデータなので、dbと同じでないといけない。
          "cvc_check":"passed",
          "exp_month":2,
          "exp_year":2022,
          "fingerprint":"e1d8225886e3a7211127df751c86787f",
          "last4":"4242",
          "livemode":false,
          "metadata":{},
          "name":"",
          "object":"card",
          }],
          "has_more":false,
          "object":"list",
          "url":"/v1/customers/cus_8241fab179982d39cd973023a2e1/cards",
        },

      "created": 1584597777,
      "default_card": "car_c91aa7d8ec85573dd4b4fdcfb99c",
      "description": "登録テスト",
      "email": "test@gmail.com",
      "livemode": false,
      "metadata": {"user_id":"1"},
      "object": "customer",
      "subscriptions": {"count":0,"data":[],"has_more":false,"object":"list","url":"/v1/customers/cus_8241fab179982d39cd973023a2e1/subscriptions"},
    }
  end
end

