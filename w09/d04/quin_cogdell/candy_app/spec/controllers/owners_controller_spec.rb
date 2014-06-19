require 'spec_helper'

describe OwnersController do

  describe "GET #index" do

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end

    it "assings all the Owner as @owners" do
      owner = Owner.new
      owner.name = "Quin"
      owner.save

      get :index

      owners_array = []
      owners_array << owner

      expect(assigns(:owners)).to match_array(owners_array)
    end

  end

  describe 'GET #show' do
    let(:owner) do
      Owner.create(name: "Quin")
    end

    it "renders the show view" do
      get :show, id: owner.id
      expect( response ).to render_template :show
    end

    it "assigns the owner to @owner" do
      get :show, id: owner.id
      expect( assigns(:owner)).to eq(owner)
    end
  end

  describe 'GET #new' do

    it "renders the 'new' view" do
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new owner to @owner" do
      get :new
      expect( assigns(:owner) ).to be_a_new(Owner)
    end

  end

end
