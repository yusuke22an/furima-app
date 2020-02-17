# furima DB設計

## usersテーブル
|Column|Type|Options|Meaning|attention|
|------|----|-------|-------|---------|
|nickname|string|null: false|ニックネーム||
|email|string|null: false, unique: true|メールアドレス||
|password|string|null: false|パスワード|deviseで2度入力させる仕様にする|
|last_name|string|null: false|名字|全角のみにバリデーション要|
|last_name_furigana|string|null: false|みょうじ|全角のみにバリデーション要|
|first_name|string|null: false|名前|全角のみにバリデーション要|
|first_name_furigana|string|null: false|なまえ|全角のみにバリデーション要|
|year_of_birth|integer|null: false, limit: 4|誕生年|フォームで選択式にする|
|month_of_birth|integer|null: false, limit: 2|誕生月|フォームで選択式にする|
|day_of_birth|integer|null: false, limit: 2|誕生日|フォームで選択式にする|
|delivery_last_name|string|null: false|送付先名字||
|delivery_first_name|string|null: false|送付先名前||
|zip|string|null: false,limit: 8|郵便番号|郵便番号用のバリデーション要|
|prefectures|string|null: false|都道府県|フォームで選択式にする|
|municipality|string|null: false|市区町村||
|address|string|null: false|番地||
|building_name|string||マンション名やビル名・部屋号室等||
|phone_number|string||お届け先電話番号|電話番号用のバリデーション要|


### Association
- has_many :cards, dependent: :destroy
- has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
- has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"

## cardsテーブル
|Column|Type|Options|Meaning|attention|
|------|----|-------|-------|---------|
|customer_id|string|null: false|payjpの顧客id||
|card_id|string|null: false|payjpのデフォルトカードid||
|user_id|integer|null: false, foreign_key: true|Userとの外部キー||

### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|Meaning|attention|
|------|----|-------|-------|---------|
|name|string|null: false|商品名||
|text|text|null: false|商品説明||
|status|string|null: false|商品の状態|フォームで選択式にする|
|brand_name|string||ブランド名||
|shipping_charges|string|null: false|配送料の負担|フォームで選択式にする|
|shipping_area|string|null: false|発送元の地域|フォームで選択式にする|
|days_to_ship|string|null: false|発送までの日数|フォームで選択式にする|
|price|integer|null: false|価格|半角のみにバリデーション要|
|photo_id|integer|null: false, foreign_key: true|Photoとの外部キー||
|category_id|integer|null: false, foreign_key: true|Categoryとの外部キー||
|saler_id|integer|null: false, foreign_key: true, class_name: "User"|Userとの外部キー|実装難しそう|
|buyer_id|integer|null: false, foreign_key: true, class_name: "User"|Userとの外部キー|実装難しそう|

### Association
- has_many :photos, dependent: :destroy
- belongs_to :category
- belongs_to :saler
- belongs_to :buyer


## photosテーブル
|Column|Type|Options|Meaning|attention|
|------|----|-------|-------|---------|
|url|string||写真のURL|1枚は必須かつ5枚まで登録可能(2枚目以降は任意)なバリデーション要|
|item_id|integer|null: false, foreign_key: true|Itemとの外部キー||

### Association
- belongs_to :item

## brandsテーブル
|Column|Type|Options|Meaning|attention|
|------|----|-------|-------|---------|
|name|string||ブランド名|seedでブランド名を事前に流し込み、フォームで選択式にさせる。indexを貼る|

### Association
- has_many :items

## categorysテーブル
|Column|Type|Options|Meaning|attention|
|------|----|-------|-------|---------|
|name|string||カテゴリー名|seedでカテゴリー名を事前に流し込み、フォームで選択式にさせる。indexを貼る|
|ancestry|string||親子孫識別|ancestry gemを用いる|

### Association
- has_many :items