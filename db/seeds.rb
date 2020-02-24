# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

woman = Category.create(name: "レディース")
woman_tops = woman.children.create(name: "トップス")
woman_shoes = woman.children.create(name: "靴")
woman_bag = woman.children.create(name: "バッグ")
woman_tops.children.create([{name: "Tシャツ"}, {name: "パーカー"}, {name: "カーディガン"}])
woman_shoes.children.create([{name: "スニーカー"}, {name: "ハイヒール"}, {name: "ブーツ"}])
woman_bag.children.create([{name: "トートバッグ"}, {name: "ショルダーバッグ"}, {name: "クラッチバッグ"}])

man = Category.create(name: "メンズ")
man_tops = man.children.create(name: "トップス")
man_shoes = man.children.create(name: "靴")
man_bag = man.children.create(name: "バッグ")
man_tops.children.create([{name: "ネルシャツ"}, {name: "Yシャツ"}, {name: "セーター"}])
man_shoes.children.create([{name: "ビジネスシューズ"}, {name: "スリッパ"}, {name: "ブーツ"}])
man_bag.children.create([{name: "ビジネスバッグ"}, {name: "セカンドバッグ"}, {name: "リュックサック"}])

sports = Category.create(name: "スポーツ")
sports_golf = sports.children.create(name: "ゴルフ")
sports_baseball = sports.children.create(name: "野球")
sports_soccer = sports.children.create(name: "サッカー")
sports_golf.children.create([{name: "クラブ"}, {name: "ウェア"}, {name: "バッグ"}])
sports_baseball.children.create([{name: "バット"}, {name: "グローブ"}, {name: "スパイク"}])
sports_soccer.children.create([{name: "ボール"}, {name: "スパイク"}, {name: "ウェア"}])
