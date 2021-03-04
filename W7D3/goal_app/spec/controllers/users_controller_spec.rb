require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it 'renders new user' do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe "POST " do
    let(:valid_params) { {user: { username: "name", email: "name@name.com", password: "whatever"}}}
    let(:invalid_params) { {user: { username: "name", email: "name@name.com", password: ""}}}
    let(:user) { User.find_by(username: "name")}

    context "wit valid params" do
      before :each do
        post :create, params: valid_params
      end

      it "creates user" do
        expect(User.last.username).to eq("name")
      end

      it "logs in the user" do
        expect(session[:session_token]).to eq(user.session_token)
      end

      it "redirects to user show page" do
        expect(response).to redirect_to(user_url(user))
      end
    end

    context "with invalid params" do
      before :each do
        post :create, params: invalid_params
      end

      it "renders new template" do
        expect(response).to render_template(:new)
      end

      it "flashes errors" do
        expect(flash[:errors]).to be_present
      end
    end
  end
end
