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

  it 'should create new account' do
    post :create, account: {name:'BogdanChaban', age: 25}
    expect(assigns[:account]).not_to be_nil
    expect(assigns[:account].errors.size).to eql(0)
    expect(Account.where(name: 'BogdanChaban').first).not_to be_nil
  end

  it 'should not create new account' do
    post :create, account: {name:'B', age: -10}
    expect(assigns[:account]).not_to be_nil
    expect(assigns[:account].errors.size).to eql(2)
    expect(assigns[:account].errors.messages[:name]).not_to be_nil
    expect(assigns[:account].errors.messages[:age]).not_to be_nil
    expect(Account.where(name: 'B').first).to be_nil
  end

  it 'should find Accounts by name' do
    create(:account, name: 'GubkaBob')
    get :find_by_name, name: 'GubkaBob'
    expect(assigns[:accounts].size).not_to eql(0)
    expect(assigns[:accounts].first.name).to eql('GubkaBob')
  end

  it 'should find all accounts like name' do
    5.times do |i|
      create(:account, name: "GubkaBob#{i}")
    end
    get :index
    expect(assigns[:accounts].size).to eql(5)
    expect(Account.all.size).to eql(5)
  end

end