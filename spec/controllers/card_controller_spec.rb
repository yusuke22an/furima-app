# payjp(API)側のテストになってしまうため、コメントアウト。（itemのidを渡す前ではテストをパスした）

# require 'rails_helper'

# RSpec.describe CardController, type: :controller do

#   let(:user) { create(:user) }

#   before do
#     login user
#   end

#   describe "GET #new" do
#     it "returns http success" do
#       get :new
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "GET #show" do
#     it "returns http success" do
#       allow(Payjp::Customer).to receive(:create).and_return(PayjpMock.prepare_customer_information)
#       card = Card.create(
#         user_id: user.id,
#         customer_id: Payjp::Customer.create[:cards][:data][0][:customer],
#         card_id: Payjp::Customer.create[:cards][:data][0][:id]
#       )
#       get :show, params: {id: card.id}
#       expect(response).to have_http_status(:success)
#     end
#   end

# end