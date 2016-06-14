require 'rails_helper'

describe AccountsController do

  it 'assigns @accounts variable' do
    acc =create(:account)
    get :index
    expect(assigns[:accounts]).not_to be_nil
    expect(assigns[:accounts].first.name).to eql(acc.name)
  end

  it 'assigns @account variable' do
    get :new
    expect(assigns[:account]).not_to be_nil
  end

end