require 'rails_helper'

describe Item do

  describe "#商品出品のテスト" do

    #全項目
    it "全ての項目が適切に入力されていれば登録できるテスト" do
      item = build(:item)
      expect(item).to be_valid
    end

    #name
    it "商品名が空の場合登録できないテスト" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    #text
    it "商品説明が空の場合登録できないテスト" do
      item = build(:item, text: "")
      item.valid?
      expect(item.errors[:text]).to include("can't be blank")
    end
    
    #status
    it "ステータスが空の場合登録できないテスト" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end

    #shipping_charges
    it "配送料が未選択の場合に登録できないテスト" do
      item = build(:item, shipping_charges: "")
      item.valid?
      expect(item.errors[:shipping_charges]).to include("can't be blank")
    end

    #shipping_area
    it "配送元地域が未選択の場合に登録できないテスト" do
      item = build(:item, shipping_area: "")
      item.valid?
      expect(item.errors[:shipping_area]).to include("can't be blank")
    end

    #days_to_ship
    it "配送期間が未選択の場合に登録できないテスト" do
      item = build(:item, days_to_ship: "")
      item.valid?
      expect(item.errors[:days_to_ship]).to include("can't be blank")
    end

    #price
    it "価格が未入力の場合に登録できないテスト" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "saler_idに入るユーザーidがなければ登録できないテスト" do
      item = build(:item, saler_id: "")
      item.valid?
      expect(item.errors[:saler_id]).to include("can't be blank")
    end

    it "category_idに入るカテゴリーidがなければ登録できないテスト" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end
  end

  describe "#商品情報編集のテスト" do
    #全項目
    it "全ての項目が適切に入力されていれば登録できるテスト" do
      item = build(:item)
      expect(item).to be_valid
    end

    #name
    it "商品名が空の場合登録できないテスト" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    #text
    it "商品説明が空の場合登録できないテスト" do
      item = build(:item, text: "")
      item.valid?
      expect(item.errors[:text]).to include("can't be blank")
    end
    
    #status
    it "ステータスが空の場合登録できないテスト" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end

    #shipping_charges
    it "配送料が未選択の場合に登録できないテスト" do
      item = build(:item, shipping_charges: "")
      item.valid?
      expect(item.errors[:shipping_charges]).to include("can't be blank")
    end

    #shipping_area
    it "配送元地域が未選択の場合に登録できないテスト" do
      item = build(:item, shipping_area: "")
      item.valid?
      expect(item.errors[:shipping_area]).to include("can't be blank")
    end

    #days_to_ship
    it "配送期間が未選択の場合に登録できないテスト" do
      item = build(:item, days_to_ship: "")
      item.valid?
      expect(item.errors[:days_to_ship]).to include("can't be blank")
    end

    #price
    it "価格が未入力の場合に登録できないテスト" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "saler_idに入るユーザーidがなければ登録できないテスト" do
      item = build(:item, saler_id: "")
      item.valid?
      expect(item.errors[:saler_id]).to include("can't be blank")
    end

    it "category_idに入るカテゴリーidがなければ登録できないテスト" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end
  end
end