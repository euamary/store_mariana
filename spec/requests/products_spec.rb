require "rails_helper"

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    it "returns success for a guest" do
      get products_path

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /products/new" do
    context "when authenticated" do
      let(:user) { create(:user) }

      before { sign_in_as(user) }

      it "returns success" do
        get new_product_path

        expect(response).to have_http_status(:success)
      end
    end

    context "when a guest" do
      it "redirects to the login page" do
        get new_product_path

        expect(response).to redirect_to(new_session_path(locale: "en"))
      end
    end
  end

  describe "POST /products" do
    let(:user) { create(:user) }

    before { sign_in_as(user) }

    context "with valid params" do
      it "creates a product" do
        expect {
          post products_path, params: { product: { name: "Pudim" } }
        }.to change(Product, :count).by(1)
      end
    end

    context "with invalid params" do
      it "does not create a product" do
        expect {
          post products_path, params: { product: { name: "" } }
        }.not_to change(Product, :count)
      end
    end
  end
end
