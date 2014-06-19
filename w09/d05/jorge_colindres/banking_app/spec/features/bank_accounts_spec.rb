require 'spec_helper'

describe "BankAccount" do
  context "when a user is logged in" do
    before(:each) do
      user = User.create(email: "test@test.net", password: "12345678", password_confirmation: "12345678")
      user.bank_accounts.create(name: "Checking", balance: 50.00)
      visit login_path
      page.fill_in "email", :with => user.email
      page.fill_in "password", :with => user.password
      click_button "Log In"
    end

    describe "visiting the bank account page" do
      before(:each) { click_link "Checking" }

      it "displays the name of the account" do
        expect(page).to have_content "Checking"
      end

      it "does not display the name of other accounts" do
        expect(page).to_not have_content "Savings"
      end

      it "displays the account's balance" do
        expect(page).to have_content "$50.00"
      end

      it "has a link to go back to the main user page" do
        expect(page).to have_link "Back"
        click_link "Back"
        expect(page).to have_content "Your Account"
      end

      it "has an account history" do
        expect(page).to have_content "Account History"
        expect(page).to have_css ".account-history"
      end

      it "has a table with headings Date, Type, Amount and Memo" do
        expect(page).to have_content "Date"
        expect(page).to have_content "Type"
        expect(page).to have_content "Amount"
        expect(page).to have_content "Memo"
      end

      describe "#transactions" do
        it "shows the date of a transaction" do
          pending
        end

        it "show the type of a transaction" do
          pending
        end

        it "show the amount of a transaction" do
          pending
        end

        it "show the memo of a transaction" do
          pending
        end
      end
    end

    describe "visiting the 'Add Account' page for a user" do
      before(:each) { click_link "Add Account" }

      it "has a name text field" do
        expect(page).to have_content "Name"
      end

      it "has a starting balance text field" do
        expect(page).to have_content "Starting Balance"
      end

      it "has a create button" do
        expect(page).to have_button "Create Bank account"
      end
    end

    describe "creating a new bank account for a user with mistakes" do
      before(:each) { click_link "Add Account" }

      it "displays an error flash if the name is blank" do
        page.fill_in "Name", :with => ""
        page.fill_in "Starting Balance", :with => "50.00"
        click_button "Create Bank account"
        expect(page).to have_content "Error, try again"
      end

      it "displays an error flash if the starting balance is blank" do
        page.fill_in "Name", :with => "Savings"
        page.fill_in "Starting Balance", :with => ""
        click_button "Create Bank account"
        expect(page).to have_content "Error, try again"
      end

      it "displays an error if the name is not unique" do
        page.fill_in "Name", :with => "Checking"
        page.fill_in "Starting Balance", :with => "50.00"
        click_button "Create Bank account"
        expect(page).to have_content "Error, try again"
      end
    end

    describe "creating a valid new bank account for a user" do
      before(:each) do
        click_link "Add Account"
        page.fill_in "Name", :with => "Savings"
        page.fill_in "Starting Balance", :with => "50.00"
        click_button "Create Bank account"
      end

      it "redirects to the new account page" do
        expect(page).to have_content "Savings"
      end

      it "display a success flash" do
        expect(page).to have_content "New account created"
      end
    end

    describe "the deposit page" do
      # have to turn off transactional fixtures to test these because js: true
      before(:each) do
        click_link "Deposit"
      end

      it "has a cancel link that takes you back to profile page" do
        expect(page).to have_content "Cancel"
        click_link "Cancel"
        expect(page).to have_content "Your Account"
      end

      it "displays a form to make a deposit" do
        expect(page).to have_css "form"
      end

      it "has a select menu with the accounts" do
        expect(page).to have_css "#user_bank_accounts"
      end

      it "has an amount input text field" do
        expect(page).to have_css "#amount"
      end

      context "when submiting the form" do
        before(:each) do
          page.fill_in "Amount", :with => "100"
          click_button "Deposit"
        end

        it "updates the total balance" do
          expect(page).to have_content "Total Balance: $150.00"
        end

        it "updates the account's balance" do
          expect(page).to have_content "Checking $150.00"
        end
      end
    end
  end
end
