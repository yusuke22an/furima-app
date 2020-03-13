require 'rails_helper'

RSpec.describe PurchaseController, type: :controller do

  let(:user) { create(:user) }

  describe "GET #index" do
    before do
      login user
    end
    it "returns http success" do
      allow(Payjp::Customer).to receive(:create).and_return(PayjpMock.prepare_customer_information)
      card = Card.create(
        user_id: user.id,
        customer_id: Payjp::Customer.create[:cards][:data][0][:customer],
        card_id: Payjp::Customer.create[:cards][:data][0][:id]
      )
      get :index, params: { item_id: item.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #done" do
    it "returns http success" do
      get :done
      expect(response).to have_http_status(:success)
    end
  end

end
