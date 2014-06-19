require 'spec_helper'
describe OwnersController do
  describe 'GET #index' do
    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end
    it "assigns all the owners as @owners" do
      owner = Owner.create
      get :index
      expect( assigns(:owners) ).to match_array([owner])
    end
  end
  describe 'GET #show' do
    let(:owner) {Owner.create}
    it "renders the show view" do
      get :show, id: owner.id
      expect(response).to render_template :show
    end
    it "assigns the owner to @owner" do
      get :show, id: owner.id
      expect( assigns(:owner) ).to eq(owner)
    end
  end
  describe 'GET #new' do
    it "renders the 'new' view " do
      get :new
      expect(response).to render_template :new
    end
    it "assigns a new owner to @owner" do
      get :new
      expect( assigns(:owner) ).to be_a_new( Owner )
    end
  end
  describe 'GET #edit' do
    let(:owner) {Owner.create}
    it "renders the 'edit' view" do
      get :edit, id: owner.id
      expect(response).to render_template(:edit)
    end
    it "assigns the owner to @owner" do
      get :edit, id: owner.id
      expect( assigns(:owner) ).to eq(owner)
    end
  end
  describe "POST #create" do
    it "redirects to the new owner" do
      post :create, {owner:{}}

      expect( response ).to redirect_to Owner.last
    end
    it "creates a new owner" do
      expect {  post :create, {owner:{}} }.to change { Owner.count }.by(1)
    end
  end
end
