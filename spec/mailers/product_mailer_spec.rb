require "rails_helper"

RSpec.describe ProductMailer, type: :mailer do
  describe "#in_stock" do
    let(:product) { create(:product, name: "Brownie") }
    let(:subscriber) { create(:subscriber, product: product) }
    let(:mail) { ProductMailer.with(product: product, subscriber: subscriber).in_stock }

    it "renders the subject" do
      expect(mail.subject).to eq("In stock")
    end

    it "renders the receiver" do
      expect(mail.to).to eq([ subscriber.email ])
    end

    it "includes the product name in the body" do
      expect(mail.body.encoded).to match(product.name)
    end
  end

  describe "enqueuing" do
    let(:product) { create(:product, inventory_count: 0) }
    let!(:subscriber) { create(:subscriber, product: product) }

    it "sends an email when inventory goes from zero to positive" do
      expect {
        product.update!(inventory_count: 10)
      }.to have_enqueued_mail(ProductMailer, :in_stock)
    end
  end
end
