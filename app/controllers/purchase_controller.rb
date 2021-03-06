class PurchaseController < ApplicationController
  before_action :set_item, only: [:index, :pay, :done]
  require 'payjp'

  def index
    if user_signed_in?
      card = Card.where(user_id: current_user.id).first
      #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
      if card.blank?
        #登録された情報がない場合にカード登録画面に移動
        redirect_to controller: "card", action: "new"
      else
        Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
        #保管した顧客IDでpayjpから情報取得
        customer = Payjp::Customer.retrieve(card.customer_id)
        #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
        @default_card_information = customer.cards.retrieve(card.card_id)
      end
    else
      redirect_to new_user_session_path
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    # card = nil # エラーハンドリング用の記述 エラー発生させる時はコメントアウトして下さい。
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]  
    if card.blank?
      redirect_to controller: "card", action: "new"
      flash[:notice] = '購入失敗です。カード登録の確認をして下さい.'
    elsif Payjp::Charge.create(
      amount: @item.price,  #支払金額を入力（itemテーブル等に紐づけても良い）
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
    )
      if @item.update(buyer_id: current_user.id)
        flash[:notice] = 'Event was successfully updated.'
      else
        flash[:notice] = '失敗しました。確認して下さい。'
      end
      redirect_to action: 'done' #完了画面に移動
    else
      redirect_to action: "index" 
      flash[:notice] = '購入に失敗しました.'
    end
  end


  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end