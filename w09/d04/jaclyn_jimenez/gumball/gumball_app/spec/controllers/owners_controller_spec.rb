require 'spec_helper'

describe OwnersController do

  #index
  describe "GET #index" do

    it "responds to index" do
      get :index
      response.should render_template :index
    end
    #get all the owners
    it "assigns all the owners as @owners" do
      owner = Owner.create({money: 0})

      get :index
      assigns(:owners).should eq([owner])

    end



  end

  #show

  describe "GET #show" do
    let( :owner ) do
      Owner.create({money: 0})
    end
    it "renders the show view" do
      get :show, id: owner.id
      expect( response ).to render_template :show
    end
    it "assigns the owner to @owner" do
      get :show, id: owner.id
      expect( assigns(:owner) ).to eq( owner )
    end

  end

  #new

  describe "GET #new" do
    it "renders the new view" do
      get :new
      expect( response ).to render_template :new
    end
    it "assigns new owner to @owner" do
      get :new
      expect( assigns(:owner) ).to be_a_new( Owner )
    end
  end
  #edit
  describe "GET #edit" do
    let( :owner ) do
      Owner.create({money: 0})
    end
    it "render edit view" do
      get :edit, id: owner.id
      expect( response ).to render_template :edit
    end

    it "assigns the owner to @owner" do
      get :edit, id: owner.id
      expect( assigns(:owner) ).to eq( owner )
    end

  end

  #create
  describe "POST #create" do
    context "when there are vaild params" do
      let( :valid_owner_params ) do
        {
          owner: {money: 0}
        }
      end

      it "creates new owner" do
        expect { post :create, valid_owner_params }.to change {Owner.count}
      end

      it "redirects to new owner" do
        post :create, valid_owner_params
        expect( response ).to redirect_to Owner.last
      end
    end
    context "when there are invalid params" do
      let(:invalid_owner_params) do
        {:owner => {}}
      end

      it "renders the new page" do
        post :create, invalid_owner_params
        expect( response ).to render_template :new
      end
      it "does not create new owner" do
        expect { post :create, invalid_owner_params }.to change {Owner.count}.by(0)
      end

    end
  end
  #update
  describe "#post update" do
    context "when there are vaild params" do
      before(:each) do
        @test_owner = Owner.create({:money => 0.0})
        @amount = 600.0
      end
      it "updates the owner" do
        expect{ post :update, :id => @test_owner.id, :owner => {:money => @amount} }.to change{Owner.find_by_id(@test_owner.id).money}.by(@amount)
      end
    end
  end
  #destroy
  describe "POST #destroy" do
    context "when there are vaild params" do
      before(:each) do
        @owner = Owner.create({money: 0})
      end
      it "deletes the entry at given ID" do
        expect { delete :destroy, id: @owner.id }.to change{Owner.all.length}.by(-1)
      end
    end
  end




end
