require 'rails_helper'

describe AccountsController do
  let(:valid_attributes) { { name: 'HomerSimp', age: 48 } }

  describe "GET index" do
    it "assigns all accounts as @accounts" do
      account = Account.create! valid_attributes
      get :index
      expect(assigns(:accounts)).to eq([account])
    end
  end
  describe "GET show" do
    it "assigns the requested account as @account" do
      account = Account.create! valid_attributes
      get :show, {:id => account.to_param}
      expect(assigns(:account)).to eq(account)
    end
  end
  describe "GET new" do
    it "assigns a new account as @account" do
      get :new
      expect(assigns(:account)).to be_a_new(Account)
    end
  end

  it 'should find Accounts by name' do
    create(:account, name: 'GubkaBob')
    get :find_by_name, name: 'GubkaBob'
    expect(assigns[:accounts].size).not_to eql(0)
    expect(assigns[:accounts].first.name).to eql('GubkaBob')
  end

  describe "GET edit" do
    it "assigns the requested account as @account" do
      account = Account.create! valid_attributes
      get :edit, {:id => account.to_param}
      expect(assigns(:account)).to eq(account)
    end
  end
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Account" do
        expect {
          post :create, {:account => valid_attributes}
        }.to change(Account, :count).by(1)
      end
      it "assigns a newly created account as @account" do
        post :create, {:account => valid_attributes}
        expect(assigns(:account)).to be_a(Account)
        expect(assigns(:account)).to be_persisted
      end
      it "redirects to the created account" do
        post :create, {:account => valid_attributes}
        expect(response).to redirect_to(account_url(assigns(:account).id))
      end
    end
    describe "with invalid params" do
      it "assigns a newly created but unsaved account as @account" do
        allow_any_instance_of(Account).to receive(:save).and_return(false)
        post :create, {:account => { "name" => "invalid value" }}
        expect(assigns(:account)).to be_a_new(Account)
      end
      it "re-renders the 'new' template" do
        allow_any_instance_of(Account).to receive(:save).and_return(false)
        post :create, {:account => { "name" => "invalid value" }}
        expect(response).to render_template("new")
      end
    end
  end
  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested account" do
        account = Account.create! valid_attributes
        expect_any_instance_of(Account).to receive(:update).with({ "name" => "MyString" })
        put :update, {:id => account.to_param, :account => { "name" => "MyString" }}
      end
      it "assigns the requested account as @account" do
        account = Account.create! valid_attributes
        put :update, {:id => account.id, :account => valid_attributes}
        expect(assigns(:account)).to eq(account)
      end
      it "redirects to the account" do
        account = Account.create! valid_attributes
        put :update, {:id => account.id, :account => valid_attributes}
        expect(response).to redirect_to(account_url(account.id))
      end
    end
    describe "with invalid params" do
      it "assigns the account as @account" do
        account = Account.create! valid_attributes
        allow_any_instance_of(Account).to receive(:save).and_return(false)
        put :update, {:id => account.to_param, :account => { "name" => "invalid value" }}
        expect(assigns(:account)).to eq(account)
      end
      it "re-renders the 'edit' template" do
        account = Account.create! valid_attributes
        allow_any_instance_of(Account).to receive(:save).and_return(false)
        put :update, {:id => account.to_param, :account => { "name" => "invalid value" }}
        expect(response).to render_template("edit")
      end
    end
  end
  describe "DELETE destroy" do
    it "destroys the requested account" do
      account = Account.create! valid_attributes
      expect {
        delete :destroy, {:id => account.id}
      }.to change(Account, :count).by(-1)
    end
    it "redirects to the account list" do
      account = Account.create! valid_attributes
      delete :destroy, {:id => account.id}
      expect(response).to redirect_to(accounts_url)
    end
  end
end