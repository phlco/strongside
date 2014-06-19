require 'spec_helper'

describe OwnersController do

  describe 'GET #index' do

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns all owners as @owners" do
      owner = Owner.new
      owner.save
      get :index
      expect(assigns(:owners)).to eq([owner])
    end

  end

  describe 'GET #show' do

    let(:owner) do
      Owner.create
    end

    it "renders the show view" do
      get :show, id: owner.id
      expect(response).to render_template :show
    end

    it "assigns the owner to @owner" do
      get :show, id: owner.id
      expect(assigns(:owner)).to eq(owner)
    end

  end

  describe 'GET #new' do

    it "renders a new view" do
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new owner to @owner" do
      get :new
      expect(assigns(:owner)).to be_a_new( Owner )
    end

  end

  describe 'GET #edit' do

    let(:owner) do
      Owner.create
    end

    it "renders the edit view" do
      get :edit, id: owner.id
      expect(response).to render_template :edit
    end

    it "assigns owner to @owner" do
      get :edit, id: owner.id
      expect(assigns(:owner)).to eq(owner)
    end

  end

  describe 'POST #create' do

    context "when there are valid params" do

      let(:valid_owner_params)do
        {owner: {
          id: self.id
          }}
      end

      it "rediects to new owner" do
        post :create, valid_owner_params
        expect(response).to render_template Owner.last
      end

      it "creates a new owner" do
        expect { post :create, valid_owner_params }.to change { Owner.all.length }.by(1)
      end

    end

    context "when there are invalid params" do

      let(:invalid_owner_params) do
        {}
      end

      it "renders the new page" do
        post :create, invalid_owner_params
        expect(response).to render_template :new
      end

      it "create a new owner" do
        expect { post :create, invalid_owner_params }.to change { Owner.count }.by(0)
      end

    end

  end



end