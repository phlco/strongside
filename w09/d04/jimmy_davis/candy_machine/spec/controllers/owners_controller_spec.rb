require 'spec_helper'

describe OwnersController do

  # index
  describe 'GET #index' do

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns all the owners as @owners" do
      owner = Owner.create

      get :index

      owners_array = []
      owners_array << owner

      expect( assigns(:owners) ).to match_array(owners_array)
    end

  end


  # show
  describe 'GET #show' do

    let(:owner) { Owner.create }

    it "renders the show view" do
      get :show, id: owner.id
      expect(response).to render_template :show
    end

    it "assigns each owner as @owner" do
      get :show, id: owner.id
      expect( assigns(:owner) ).to eq(owner)
    end

  end


  # new
  describe 'GET #new' do

    it "renders the new view" do
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new owner to @owner" do
      get :new
      expect( assigns(:owner) ).to be_a_new( Owner )
    end

  end


  # edit
  describe 'GET #edit' do

    let(:owner) { Owner.create }

    it "renders the edit view" do
      get :edit, id: owner.id
      expect(response).to render_template :edit
    end

    it "assigns an edited owner to @owner" do
      get :edit, id: owner.id
      expect( assigns(:owner) ).to eq(owner)
    end

  end

  # create
  describe 'POST #create' do
# nothing is validated when an owner is created
    context "when a new owner is created" do
      let(:new_owner) do
       {
        owner: {}
        }
      end

      it "redirects to the newly created owner" do
        post :create, new_owner
        expect(response).to redirect_to Owner.last
      end

      it "creates a new owner" do
        expect { post :create, new_owner }.to change { Owner.count }.by(1)
      end
    end

  end


  # update
  describe 'PUT #update' do

  let(:owner) { Owner.create }

    it "renders the edit page" do
      put :update, id: owner.id
      expect(response).to render_template(:edit)
    end

  end


  # destroy

  describe 'POST #destroy' do

    let(:owner) { Owner.create }

    it "deletes an owner" do
      post :destroy, id: owner.id
      expect( Owner.exists?(owner.id) ).to be_false
    end
  end

end
