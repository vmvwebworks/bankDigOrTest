require 'rails_helper'
require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
RSpec.describe User, type: :model do
  puts "cleaning test db before running tests..."
  DatabaseCleaner.clean
  puts "seed db with banks..."
  Rails.application.load_seed
  puts "testing user model"
  it "is valid with valid attributes" do
    User.create(name: "valid user", email: "validemail@specmarcos.co", password: "123456", password_confirmation: '123456', bank_id: 1)
    resUser = User.find_by(name: "valid user")
    expect(resUser.name).to eq("valid user")
    expect(resUser.bank.name).to eq("Bankinter")
    expect(resUser.email).to eq("validemail@specmarcos.co")
  end
end
