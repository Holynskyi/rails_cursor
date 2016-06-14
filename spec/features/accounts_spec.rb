require 'rails_helper'


feature 'Accounts' do

  scenario 'User can views all users on index page' do
    visit accounts_path
    expect(page).to have_content 'Listing Accounts'
  end

  scenario 'User can create new account' do
    visit new_account_path
    expect(page).to have_content 'New Account'
  end

end