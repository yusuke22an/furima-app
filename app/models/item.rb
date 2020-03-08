class Item < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  has_many_attached :photos

  validates :name, presence: true
  validates :text, presence: true, length:{ maximum: 1000}
  validates :status, presence: true
  validates :shipping_charges, presence: true
  validates :shipping_area, presence: true
  validates :days_to_ship, presence: true
  validates :price, presence: true, format:{ with:/\A[0-9]+\z/ }

end

  #バリデーションの実装において確認中
  # validate :photos_presence

  # def photos_presence
  #   if photos.attached?
  #     if !photos.content_type.in?(%('photos/jpeg photos/png'))
  #       errors.add(:photos, 'にはjpegまたはpngファイルを添付してください')
  #     end
  #   else
  #     errors.add(:photos, 'ファイルを添付してください')
  #   end
  # end

  # エラーメッセージの表示
  # def item_input_error
  #   if name.blank?
  #       errors[:base] = "メールアドレスを入力してください"
  #   elsif email.length > 255
  #       errors[:base] = "メールアドレスは255文字以内で入力してください"
  #   elsif email.match(VALID_EMAIL_REGEX) == nil
  #       errors[:base] = "メールアドレスが不正です"
  #   end
  # end



