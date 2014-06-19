require 'spec_helper'

describe OwnersController do

  describe "GET 'index'" do
    before(:each) do
      get :index
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }

    it "assigns all the owners as @owners" do
      owner = Owner.create
      get :index
      expect(assigns(:owners)).to match_array([owner])
    end
  end

  describe "GET 'show'" do
    let(:owner){ Owner.create }
    before(:each) do
      get :show, :id => owner.id
    end

    it { should respond_with(:success) }
    it { should render_template(:show) }

    it "assings the owner as @owner" do
      expect(assigns(:owner)).to eq(owner)
    end
  end

  describe "GET 'new'" do
    before(:each) do
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }

    it "assings a new owner as @owner" do
      expect(assigns(:owner)).to be_a_new(Owner)
    end
  end

  describe "POST 'create'" do
    let(:owner){ Owner.create }
    before(:each) do
      post :create, :owner => {}
    end

    it "increases the number of owners by 1" do
      expect{ Owner.create }.to change{ Owner.count }.by(1)
    end

    it "includes owner in Owner.all" do
      owner = Owner.create
      expect(Owner.all).to include(owner)
    end

    it { should redirect_to(Owner.last) }
  end

  describe "GET 'edit'" do
    let(:owner){ Owner.create }
    before(:each) do
      get :edit, :id => owner.id
    end

    it { should respond_with(:success) }
    it { should render_template(:edit) }

    it "assings the owner as @owner" do
      expect(assigns(:owner)).to eq(owner)
    end
  end

  describe "PUT 'update'" do
    let(:owner){ Owner.create }
    before(:each) do
      put :update, :id => owner.id, :owner => {}
    end

    it { should redirect_to(assigns(:owner)) }
  end

  describe "DELETE 'destroy'" do
    let(:owner){ Owner.create }
    before(:each) do
      delete :destroy, :id => owner.id
    end

    it "deletes the owner" do
      expect(Owner.all).to_not include(owner)
    end

    it { should redirect_to(owners_path) }
  end

end
