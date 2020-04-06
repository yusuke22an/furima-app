require 'rails_helper'

describe ItemsController, type: :controller do
  describe 'GET #search' do
    it 'searchアクションが動いた後、search.html.hamlに遷移する' do
      get :search
      expect(response).to render_template :search
    end

    it 'searchアクション内で定義されているインスタンス変数が期待した値になる' do
      items = create_list(:item, 3)
      get :search, params: { search: "の里" }
      expect(assigns(:items)).to match(items)
    end
  end
end