require 'spec_helper'

describe OwnersController do

  describe 'GET #index' do
    before { get :index }

    it "renders the index view" do
      response.should render_template :index
    end

    it "should render successfully" do
      response.should be_success
    end

    it "assigns all the owners as @owners" do
      owners = []
      owners << Owner.create
      get :index

      assigns(:owners).should match_array(owners)
    end
  end

  describe 'GET #show' do

    let(:owner) { Owner.create }

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
    let(:owner) { Owner.new }

    it "renders the 'edit view" do
      owner = Owner.create
      get :edit, id: owner.id
    end

  end

  describe "POST #create" do
    before { post :create }

      it "redirects to the new owner" do
        @response.should redirect_to Owner.last
      end

  end

  describe "PUT #update" do

    let!(:owner){ Owner.create }

    context "when valid parameters" do

      before do
        put :update, id: owner.id, owner: { money: 100 }
      end

      # BUG: params update in controller, but changes back upon return?
      # it "updates with new params" do
      #   expect { response }.to change { owner.money }.to(100)
      # end

      it "redirect to owners path if valid" do
        expect { response }.to redirect_to owner_path
      end

    end

    context "when invalid parameters" do

      it "redirect to owner edit if invalid" do
       put :update, id: owner.id, owner: { money: nil }
       expect { response }.to redirect_to edit_owner_path
     end
   end

 end

  describe "DELETE #destroy" do

    before do
      @owner = Owner.create
      delete :destroy, id: @owner.id
    end

    it "should delete owner" do
      expect(Owner.all).to_not include @owner
    end

    it "should delete machines related to owner" do

    end

    it "should redirect to index?" do
      response.should redirect_to owner_path
    end
  end

end
