FactoryBot.define do
  
  factory :item do
    name              {"山田の里"}
    text              {"山田が好んで着ていた洋服です"}
    status            {"新品"}
    shipping_charges  {"気分次第"}
    shipping_area     {"そのあたり"}
    days_to_ship      {"そのうち"}
    price             {"9999998"}
    saler             {create(:user)}
    category_id       {"5"}
    after(:build) do |hoge|
      hoge.photos.attach(io: File.open('public/icon-01.png'), filename: 'icon-01.png', content_type: 'image/png')
    end
  end
end