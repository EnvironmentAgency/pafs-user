# frozen_string_literal: true
require "rails_helper"

RSpec.describe AccountRequestMailer, type: :mailer do
  describe "#confirmation_email" do
    it "creates an email" do
      account_request = FactoryBot.create(:account_request)
      email = AccountRequestMailer.confirmation_email(account_request)
      expect(email.to).to eq(["neville.southall@example.com"])
      expect(email.from).to eq([ENV.fetch("DEVISE_MAILER_SENDER")])
      expect(email.body.encoded).to match("Hello Big Nev")
    end
  end

  describe "#account_created_email" do
    it "creates an email" do
      user = FactoryBot.create(:account_user)
      email = AccountRequestMailer.account_created_email(user)
      expect(email.to).to eq(["ray@example.com"])
      expect(email.from).to eq([ENV.fetch("DEVISE_MAILER_SENDER")])
      expect(email.body.encoded).to match("Hello Ray Clemence")
    end
  end
end
