require 'spec_helper'

describe OwnersController do
  let! (:owner) do
    Owner.create()
  end

  describe "GET #index" do
    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns owners as @owners" do
      owner
      get :index
      owners_array = []
      owners_array << owner
      assigns(:owners).should eq(owners_array)
    end
  end

  describe "GET #show" do
    it "renders the show view" do
      get :show, id: owner.id
      expect(response).to render_template :show
    end

    it "shows the owner that you assigned as @owner" do
      get :show, id: owner.id
      assigns(:owner).should eq(owner)
    end
  end

  describe "GET #new" do
    it "renders the new view" do
      get :new
      expect(response).to render_template :new
    end

    it "shows the new owner" do
      get :new
      assigns(:owner).should be_a_new(Owner)
    end
  end

  describe "GET #edit" do
    it "renders the edit view" do
      get :edit, id: owner.id
      expect(response).to render_template :edit
    end

    it "assigns the edit owner as @owner" do
      get :edit, id: owner.id
      assigns(:owner).should eq (owner)
    end
  end

  describe "GET #create" do
    it "redirects to the new owner" do
      post :create
      expect(response).to redirect_to Owner.last
    end

    it "creates a new owner" do
      expect{post:create}.to change{Owner.count}.by(1)
    end

    context "invalid params" do
      let(:invalid_params) do
        {owner: {
          money: "haha"
          }
        }
      end

     it "renders the view page" do
        # binding.pry
        post :create, invalid_params
        expect(response).to render_template :new
      end

      it "does not create new owner" do
        expect{post :create, invalid_params}.to change{Owner.count}.by(0)
      end
    end
  end

  describe "PUT update" do
     let(:valid_params) do
      {
        money: 800,
        candy: 1000
      }
    end

    it "redirects to the owner if successful" do
      put :update, id: owner.id, :owner => valid_params
      expect(response).to redirect_to Owner.find(owner.id)
    end

    it "updates the owner" do
      put :update, id: owner.id, :owner => valid_params
      expect(Owner.find(owner.id).money).to eq(800)
    end

    context "invalid params are submitted" do
      let(:invalid_params) do
        {
          money: "hehe",
          candy: 1000
        }
      end

      it "redirects back to edit" do
        put :update, id: owner.id, :owner => invalid_params
        expect(response).to render_template :edit
      end
    end
  end

  describe "#destroy" do
    it "destroy the owner" do
      owner
      delete :destroy, id: owner.id
      expect(Owner.exists?(owner.id)).to be_false
    end #need to fix

    it "redirects back to index" do
      delete :destroy, id: owner.id
      expect(response).to redirect_to(owners_path)
    end
  end
end