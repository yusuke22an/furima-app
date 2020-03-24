FactoryBot.define do
  
  factory :user do
    nickname              {"やまたろ"}
    email                 {Faker::Internet.free_email}
    password              {"0000000"}
    password_confirmation {"0000000"}
    last_name             {"山田"}
    last_name_furigana    {"やまだ"}
    first_name            {"太郎"}
    first_name_furigana   {"たろう"}
    year_of_birth         {"2020"}
    month_of_birth        {"2"}
    day_of_birth          {"18"}
    delivery_last_name    {"山田"}
    delivery_first_name   {"太郎"}
    zip                   {"000-0000"}
    prefectures           {"東京都"}
    municipality          {"千代田区"}
    address               {"江戸町1-1"}
    building_name         {"江戸タワー3002号室"}
    phone_number          {"000-0000-0000"}
  end

end