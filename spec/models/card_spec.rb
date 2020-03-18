require 'rails_helper'

RSpec.describe Card, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  #全項目
  it "全ての項目が適切に入力されていれば登録できるテスト" do
    card = build(:card)
    expect(card).to be_valid
  end


end
