module LoginHelper
  def login
    @user = User.create(email: "example@example.com", password: '12345678', password_confirmation: '12345678')
    @user.accounts.create(balance: 500)
    @user.accounts.create(balance: 500, name: 'Savings')
    visit root_path
    click_link "Login"
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "12345678"
    click_button "Login"
  end
end
