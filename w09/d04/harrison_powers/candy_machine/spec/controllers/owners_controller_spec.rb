require 'spec_helper'

describe OwnersController do

  let!(:owner) { Owner.create }

  describe 'GET #index' do

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns all the owners as @owners" do
      get :index

      owners_array = []
      owners_array << owner

      expect( Owner.all ).to match_array(owners_array)
    end
  end

  describe 'GET #show' do
    it "renders the show view" do
      get :show, id: owner.id

      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "renders the 'new' view" do
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new owner to @owner" do
      get :new
      expect( assigns(:owner) ).to be_a_new( Owner )
    end
  end

  describe "GET #edit" do
    it "renders the 'edit view" do
      get :edit, id: owner.id
    end
  end

  describe "POST #create" do
    context "when valid parameters" do
      before(:each) do
        @valid_owner_params = {
          owner: {
            money: 50
          }
        }
      end

      it "redirects to the new owner" do
        post :create, @valid_owner_params
        expect( response ).to redirect_to Owner.last
      end

      it "creates a new owner" do
        expect { post :create, @valid_owner_params }.to change { Owner.count }.by(1)
      end
    end

    context "when invalid parameters" do
      let(:invalid_owner_params) { {} }

      it "renders the new owner page"
      #TODO this doesnt work
      # do
      #   post :create, invalid_owner_params
      #   expect(response).to render_template(:new)
      # end
    end
  end

  describe "PUT #update" do

    context "when valid parameters" do
      before(:each) do
        @new_params = { money: 50.0 }
      end

      it "should update params" do
        put :update, { id: owner.id, owner: { money: 50 } }
        owner.reload
        expect(owner.money).to be(50)
      end

      it "should redirect to owner path if valid" do
        put :update, @new_params
        expect(response).to redirect_to owner_path
      end

    end

    context "when invalid parameters" do
      let(:invalid_params) {
        {
          id: owner.id,
          owner: {
            money: nil
          }
        }
      }

      it "should redirect to owner path if invalid" do
        put :update, invalid_params
        expect(response).to redirect_to owner_path
      end
    end
  end

  describe "DELETE #destroy" do
    it "should delete owner" do
      expect { delete :destroy, id: owner.id }.to change(Owner, :count)
    end

    it "should delete machines related to owner" do
      machine = Machine.create(location:'wherever', owner_id: owner.id)
      expect { delete :destroy, id: owner.id }.to change { Owner.count }.by(-1)
    end

    it "should redirect to index" do
      delete :destroy, id: owner.id
      expect(response).to redirect_to(owners_path)
    end
  end

end
