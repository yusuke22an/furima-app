require 'rails_helper'

describe User do
  describe "#ユーザー新規登録バリデーションテスト" do

    #全項目
    it "全ての項目が適切に入力されていれば登録できるテスト" do
      user = build(:user)
      expect(user).to be_valid
    end

    #nickname
    it "ニックネームが空の場合登録できないテスト" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    #email
    it "メールアドレスが空の場合登録できないテスト" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "重複したメールアドレスが存在する場合登録できないテスト" do
      user = create(:user)
      cyoufuku_user = build(:user)
      cyoufuku_user.valid?
      expect(cyoufuku_user.errors[:email]).to include("has already been taken")
    end

    #password
    it "パスワードが空の場合登録できないテスト" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "パスワードが7文字以上であれば登録できるテスト" do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      user.valid?
      expect(user).to be_valid
    end
    it "パスワードが6文字以下では登録できないテスト" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    #password_confirmation
    it "password_confirmationが空の場合登録できないテスト" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    #last_name
    it "名字が空の場合登録できないテスト" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end
    it "名字が全角であれば場合登録できるテスト" do
      user = build(:user, last_name: "ゼンカク")
      expect(user).to be_valid
    end
    it "名字が全角ではない場合登録できないテスト" do
      user = build(:user, last_name: "ﾊﾝｶｸ")
      user.valid?
      expect(user.errors[:last_name]).to include("is invalid")
    end

    #last_name_furigana
    it "みょうじが空の場合登録できないテスト" do
      user = build(:user, last_name_furigana: "")
      user.valid?
      expect(user.errors[:last_name_furigana]).to include("can't be blank")
    end
    it "みょうじが全角ひらがなであれば場合登録できるテスト" do
      user = build(:user, last_name_furigana: "ぜんかくひらがな")
      expect(user).to be_valid
    end
    it "みょうじが全角ではない場合登録できないテスト" do
      user = build(:user, last_name_furigana: "ﾊﾝｶｸ")
      user.valid?
      expect(user.errors[:last_name_furigana]).to include("is invalid")
    end
    it "みょうじが全角だが、ひらがなではない場合登録できないテスト" do
      user = build(:user, last_name_furigana: "否平仮名")
      user.valid?
      expect(user.errors[:last_name_furigana]).to include("is invalid")
    end

    #first_name
    it "名前が空の場合登録できないテスト" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    it "名前が全角であれば場合登録できるテスト" do
      user = build(:user, first_name: "ゼンカク")
      expect(user).to be_valid
    end
    it "名前が全角ではない場合登録できないテスト" do
      user = build(:user, first_name: "ﾊﾝｶｸ")
      user.valid?
      expect(user.errors[:first_name]).to include("is invalid")
    end

    #first_name_furigana
    it "なまえが空の場合登録できないテスト" do
      user = build(:user, first_name_furigana: "")
      user.valid?
      expect(user.errors[:first_name_furigana]).to include("can't be blank")
    end
    it "なまえが全角ひらがなであれば場合登録できるテスト" do
      user = build(:user, first_name_furigana: "ぜんかくひらがな")
      expect(user).to be_valid
    end
    it "なまえが全角ではない場合登録できないテスト" do
      user = build(:user, first_name_furigana: "ﾊﾝｶｸ")
      user.valid?
      expect(user.errors[:first_name_furigana]).to include("is invalid")
    end
    it "なまえが全角だが、ひらがなではない場合登録できないテスト" do
      user = build(:user, first_name_furigana: "否平仮名")
      user.valid?
      expect(user.errors[:first_name_furigana]).to include("is invalid")
    end

    #year_of_birth
    it "誕生年が空の場合登録できないテスト" do
      user = build(:user, year_of_birth: "")
      user.valid?
      expect(user.errors[:year_of_birth]).to include("can't be blank")
    end

    #month_of_birth
    it "誕生月が空の場合登録できないテスト" do
      user = build(:user, month_of_birth: "")
      user.valid?
      expect(user.errors[:month_of_birth]).to include("can't be blank")
    end

    #day_of_birth
    it "誕生日が空の場合登録できないテスト" do
      user = build(:user, day_of_birth: "")
      user.valid?
      expect(user.errors[:day_of_birth]).to include("can't be blank")
    end

    #delivery_last_name
    it "送付先名字が空の場合登録できないテスト" do
      user = build(:user, delivery_last_name: "")
      user.valid?
      expect(user.errors[:delivery_last_name]).to include("can't be blank")
    end

    #delivery_first_name
    it "送付先名前が空の場合登録できないテスト" do
      user = build(:user, delivery_first_name: "")
      user.valid?
      expect(user.errors[:delivery_first_name]).to include("can't be blank")
    end

    #zip
    it "郵便番号が空の場合登録できないテスト" do
      user = build(:user, zip: "")
      user.valid?
      expect(user.errors[:zip]).to include("can't be blank")
    end

    #prefectures
    it "都道府県が空の場合登録できないテスト" do
      user = build(:user, prefectures: "")
      user.valid?
      expect(user.errors[:prefectures]).to include("can't be blank")
    end

    #municipality
    it "市区町村が空の場合登録できないテスト" do
      user = build(:user, municipality: "")
      user.valid?
      expect(user.errors[:municipality]).to include("can't be blank")
    end

    #address
    it "番地が空の場合登録できないテスト" do
      user = build(:user, address: "")
      user.valid?
      expect(user.errors[:address]).to include("can't be blank")
    end

  end
end