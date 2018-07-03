require 'rails_helper'

RSpec.describe Transfer, type: :model do
  puts "Testing intra-bank transfers..."
  it "create an Intra-bank transfer" do
    user1 = User.create(name: "valid user1", email: "validemail1@specmarcos.co", password: "123456", password_confirmation: '123456', bank_id: 1, money: 1000)
    user2 = User.create(name: "valid user2", email: "validemail2@specmarcos.co", password: "123456", password_confirmation: '123456', bank_id: 1, money: 150)
    transfer = Transfer.new(sender: user1.id, receiver: user2.id, money:450, currency:"EUR", user_ids: [ user1.id, user2.id])
    if transfer.sender_user.bank.name == transfer.receiver_user.bank.name
      transfer.trans_type = "Intra-bank"
    else
      transfer.trans_type = "Inter-bank"
    end
    transfer.send_money
    expect(transfer.trans_type).to eq("Intra-bank")
    expect(transfer.sender_user.money).to eq(550)
    expect(transfer.receiver_user.money).to eq(600)
  end
  puts "Testing inter-bank transfers..."
  it "create an Inter-bank transfer" do
    user3 = User.create(name: "valid user3", email: "validemail3@specmarcos.co", password: "123456", password_confirmation: '123456', bank_id: 1, money: 1000)
    user4 = User.create(name: "valid user4", email: "validemail4@specmarcos.co", password: "123456", password_confirmation: '123456', bank_id: 3, money: 150)
    transfer = Transfer.new(sender: user3.id, receiver: user4.id, money:450, currency:"EUR", user_ids: [ user3.id, user4.id])
    if transfer.sender_user.bank.name == transfer.receiver_user.bank.name
      transfer.trans_type = "Intra-bank"
    else
      transfer.trans_type = "Inter-bank"
    end
    transfer.send_money
    transfer.save
    transfer.create_history(bank_id: transfer.sender_user.bank.id)
    expect(transfer.trans_type).to eq("Inter-bank")
    expect(transfer.sender_user.money).to eq(545)
    expect(transfer.receiver_user.money).to eq(600)
    expect(transfer.history.bank.name).to eq("Bankinter")
  end
end
