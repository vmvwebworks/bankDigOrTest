describe "registration and login", type: :feature do
  it "Create user" do
    puts "testing registrations..."
    visit '/users/sign_up'
    within("#new_user") do
      fill_in 'user_email', with: 'rtmarcos@registrationtestmarcos.co'
      fill_in 'user_name', with: 'rtmarcos'
      select("ING", from: 'user_bank_id')
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
    end
    click_on 'Sign up'
    expect(page.current_path).to eq root_path
  end
  it "User login" do
    puts "testing login..."
    User.create(name: "valid user", email: "validemail@specmarcos.co", password: "123456", password_confirmation: '123456', bank_id: 1)
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', with: 'validemail@specmarcos.co'
      fill_in 'user_password', with: '123456'
    end
    click_on 'Log in'
    expect(page.current_path).to eq root_path
  end
end
