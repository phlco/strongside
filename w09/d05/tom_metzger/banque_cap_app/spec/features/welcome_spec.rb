require 'spec_helper'

describe "banque site" do

  describe "visiting the homepage" do
    before(:each) {visit "/"}

    it "displays the homepage" do
      expect(page).to have_css("#user-greeting")
    end

    it "displays the bank name" do
      expect(page).to have_content("Banque")
    end

    describe "login" do
      it "has a login form" do
        expect(page).to have_css("#customer-login")
      end

      context "with a user logging in" do
        before(:each) do
          fill_in "Customer Login", with: "user123"
          fill_in "Customer Password", with: "a12345"
          click_button "Login"
        end

        it "logs in a user" do
          expect(page).to have_content("Welcome user123")
        end

        it "displays a user's accounts upon login" do
          within("#acct-box") {expect(page).to have_content("account 1")}
        end

        it "displays a user's total balance" do
          within("#balance") {expect(page).to have_content("Total Balance")}
        end

        describe "detailed account info" do
          before(:each) {click_on "Account 1"}

          #redirects to correct page
          it "takes user to account history page" do
            expect(page).to have_content("Account History")
          end

          # checks to see if content is displayed in account details box
          it "displays content about account" do
            within("#details") {page.has_content?}
          end
        end

        describe "withdrawls / transfers" do
          before(:each) {click_on "#withdraw-transfer"}

          it "navigates to withdrawls / transfers page" do
            expect(page).to have_content("Withdraw or Transfer Funds")
          end

          it "has boxes for withdrawl details" do
            expect(page).to have_content("#from-account")
          end

          it "only displays transfer if selected" do
            expect(page).to_not have_content("#to-account")
          end

          it "has boxes for transfer detials" do
            check "Transfer"
            expect(page).to have_content("#to-account")
          end

          it "submits withdraw and redirects to main" do
            fill_in "From Amount", with: "100.00"
            select "account 1", from: "From Account"
            check "Withdraw"
            click_button "Confirm"
            expect(page).to have_css("#user-greeting")
          end

          # CHECK DECREASE OF TOTAL AMOUNT BY 100
          # it "submits withdraw and reduces total balance" do
          #   fill_in "From Amount", with: "100.00"
          #   select "account 1", from: "From Account"
          #   check "Withdraw"
          #   click_button "Confirm"
          #   expect(page).to have_content("#user-greeting")
          # expect { @attacker.attack(@defender) }.to change { @defender.health }.by(-10)
          # end
        end
      end


    end
  end




end
