FactoryBot.define do
  
  factory :item do
    name              {"山田の里"}
    text              {"山田が好んで着ていた洋服です"}
    status            {"新品"}
    shipping_charges  {"気分次第"}
    shipping_area     {"そのあたり"}
    days_to_ship      {"そのうち"}
    price             {"9999999"}
    saler_id          {"99"}
    category_id       {"5"}
    photos            {File.new("#{Rails.root}/public/icon-01.png")}
  end

end