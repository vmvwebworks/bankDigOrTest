namespace :show_me_the_money do
  desc "Jim returns money to Emma"
  task create_jim_and_emma: :environment do
    User.create(name: "Jim", email: "jim@marcosdev.co", password: "123456", password_confirmation: '123456', money: 100000, bank_id: 1)
    User.create(name: "Emma", email: "emma@marcosdev.co", password: "123456", password_confirmation: '123456', money: 0, bank_id: 4)
  end
  task transfer_agent: :environment do
    jim = User.find_by(email: "jim@marcosdev.co")
    emma = User.find_by(email: "emma@marcosdev.co")
    transfer = jim.transfers.new(sender: jim.id, receiver: emma.id, money: 20000, currency:"EUR", user_ids: [ jim.id, emma.id])
    if transfer.sender_user.bank.name == transfer.receiver_user.bank.name
      transfer.trans_type = "Intra-bank"
    else
      transfer.trans_type = "Inter-bank"
      unless transfer.it_fails?
        abort("the inter-bank transfer failed and nothing was done, try it again")
      end
    end
    transfer.send_money
    # TODO write if it's all ok, save
    transfer.save
    transfer.create_history(bank_id: jim.bank.id)
    puts "Transaction succefully done"
  end
end
