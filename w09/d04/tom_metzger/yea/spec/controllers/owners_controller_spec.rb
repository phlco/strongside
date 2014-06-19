require 'spec_helper'

describe OwnersController do

  describe "GET #index" do

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns all owners to @owners" do
      owner = Owner.new
      owner.name = "kickhash"
      owner.save

      get :index
      owners_array = []
      owners_array << owner

      expect(assigns(:owners)).to match_array(owners_array)
    end
  end
# ------------------------------------------------
  describe "GET #show" do

    let(:owner) do
      Owner.create(name: "kickhash")
    end

    it "renders show view" do
      get :show, id: owner.id
      expect( response ).to render_template :show
    end

    it "assigns owner to @owner" do
      get :show, id: owner.id
      expect(assigns(:owner)).to eq(owner)
    end

  end
# ------------------------------------------------
  describe "Get #new" do

    let(:owner) do
      Owner.create(name: "kickhash")
    end

    it "renders new view" do
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new owner to @owners" do
      get :new
      expect(assigns(:owner)).to be_a_new(Owner)
    end

  end
# ------------------------------------------------
  describe "POST #create" do

    context "valid owner params" do
      it "redirects to newly created owner"
      it "create a new owner "
    end

    context "invalid owner params" do
      it "redirects to new"
      it "does not create a new owner"
    end

  end
# ------------------------------------------------
  describe "GET #edit" do

    it "renders edit view"
    it "assigns owner to @owner"

  end


end
