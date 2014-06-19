require 'spec_helper'

describe OwnersController do

 describe 'GET #index' do

  it "assigns all the owners as @owners" do
    owner = Owner.new(money: 500, candy:500)
    owner.save

    owners_array = []
    owners_array << owner

    get :index
    assigns(:owners).should eq(owners_array)

  end

  it "renders the index view" do
    get :index
    response.should render_template :index
  end

end

describe 'GET #show' do

  let(:owner) do
    Owner.create(money: 500, candy: 500)
  end

  it "renders the show view" do
    get :show, id: 1
    expect(response).to render_template :show
  end

  it "assigns the owner to @owner" do

    get :show, id: owner.id

    expect( assigns(:owner) ).to eq(owner)
  end

end

describe 'GET #new' do

  it "renders the new view" do
    get :new
    expect(response).to render_template :new
  end

  it "assigns a new owner to @owner" do

    get :new
    assigns(:owner).should be_a_new(Owner)
  end

end

describe 'GET #edit' do

  let(:owner) do
    Owner.create(
      money: 500,
      candy: 400
      )
  end

  it "renders the edit view" do

    get :edit, id: owner.id
    expect(response).to render_template :edit

  end

  it "assigns a owner with the given id to @owner" do

    get :edit, id: owner.id
    expect( assigns(:owner) ).to eq(owner)

  end

end

describe 'POST #create' do

  let(:owner_params) do
    { user: {
      money: 500,
      candy: 500
      }}
    end

    it "creates a new owner" do

      expect {post :create, owner_params }.to change { Owner.count }

    end
    it "redirects to the new owner" do
      post :create, owner_params
      expect( response ).to redirect_to Owner.last
    end

    it "sets attributes" do

      post :create, owner_params
      expect( Owner.last.money ).to eq(500)

    end

  end

  describe 'POST #update' do

    before(:each) do
      @owner = Owner.new
      @owner.money = 500
      @owner.candy = 400
      @owner.save
      @valid_params = { owner: {
        money: 600,
        candy: 300
        }, id: @owner.id }
      end

      it "updates an owner" do
        # binding.pry
        post :update, @valid_params
      # get :show, id: @owner.id

      expect( assigns(:owner).candy ).to eq(300)

    end

  end

  describe 'POST #destroy' do

    it "deletes an owner" do
      @owner = Owner.new
      @owner.money = 500
      @owner.candy = 500
      @owner.save

      post :destroy, id: @owner.id

      expect(Owner.exists?(@owner.id)).to be_false
    end

  end


end