require 'rails_helper'
require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
RSpec.describe User, type: :model do
  puts "cleaning test db before running tests..."
  DatabaseCleaner.clean
  puts "seed db with banks..."
  Rails.application.load_seed


  it "is valid with valid attributes" do
    user = User.create(name: "valid user", email: "validemail@specmarcos.co", password: "123456", bank_id: 1)
    expect(user.name).to eq("valid user")
    expect(user.bank.name).to eq("Bankinter")
  end
end
