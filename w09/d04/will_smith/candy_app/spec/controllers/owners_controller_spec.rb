require 'spec_helper'

describe OwnersController do
  describe 'GET #index' do
    it "renders the index view" do
      get :index
      response.should render_template :index
    end

    it "assigns all the owners as @owner" do

      owner = Owner.new
      owner.name = "Will"
      owner.save

      get :index

      owners_array = []
      owners_array << owner

      expect(assigns(:owners)).to match_array(owners_array)
    end
  end

  describe "GET #show" do
    let(:owner) do
      Owner.create( name: "Will" )
    end
    it "renders the show view" do
      get :show, id: owner.id
      expect(response).to render_template :show
    end
    it "assigns the owner to @owner" do
      get :show, id: owner.id
      expect( assigns(:owner) ).to eq(owner)
    end
  end

  describe "GET #new " do
    it "renders the #new view " do
      get :new
      expect(response).to render_template :new
    end
    it "assigns @owner as a new owner" do
      get :new
      expect( assigns(:owner)).to be_a_new(Owner)
    end
  end

  describe "GET #edit " do
    let(:owner) do
      Owner.create( name: "Will" )
    end
    it "renders the #edit view " do
      get :edit, id: owner.id
      expect(response).to render_template :edit
    end
    it "assigns the owner to update with @owner " do
      get :edit, id: owner.id
      expect(assigns(:owner)).to eq(owner)
    end
  end

  describe "POST #create " do
    context "when there are valid params" do
      let(:valid_owner_params) do
        {
          owner: {
            name: "Will"
          }
        }
      end
      it "creates a new owner" do
        expect { post :create, valid_owner_params }.to change { Owner.count }.by(1)
      end
      it "redirects to the new owner" do
        post :create, valid_owner_params
        expect(response).to redirect_to Owner.last
      end
    end
    context "when there are invalid params" do
      let(:invalid_owner_params) do
        {}
      end

      it "renders the new page" do
        post :create, invalid_owner_params
        expect(response).to render_template(:new)
      end

      it "not create a new owner" do
        expect { post :create, invalid_owner_params }.to change {Owner.count }.by(0)
      end
    end
  end


end
