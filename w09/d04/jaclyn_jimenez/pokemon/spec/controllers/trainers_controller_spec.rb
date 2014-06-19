require 'spec_helper'

describe TrainersController do

  #index
  describe "GET #index" do

    it "responds to index" do
      get :index
      response.should render_template :index
    end
    #get all the trainers
    it "assigns all the trainers as @trainers" do
      trainer = Trainer.new
      trainer.name = "ash"
      trainer.password = "kickhash"
      trainer.password_confirmation = "kickhash"
      trainer.email = "kick@hash.com"
      trainer.save

      get :index
      assigns(:trainers).should eq([trainer])

    end



  end

  #show

  describe "GET #show" do
    let( :trainer ) do
      Trainer.create(
      {
        name: "ash",
        password: "kickhash",
        password_confirmation: "kickhash",
        email: "kick@hash.com"
      }
      )
    end
    it "renders the show view" do
      get :show, id: trainer.id
      expect( response ).to render_template :show
    end
    it "assigns the trainer to @trainer" do
      get :show, id: trainer.id
      expect( assigns(:trainer) ).to eq( trainer )
    end

  end

  #new

  describe "GET #new" do
    it "renders the new view" do
      get :new
      expect( response ).to render_template :new
    end
    it "assigns new trainer to @trainer" do
      get :new
      expect( assigns(:trainer) ).to be_a_new( Trainer )
    end
  end
  #edit
  describe "GET #edit" do
    let( :trainer ) do
      Trainer.create(
      {
        name: "ash",
        password: "kickhash",
        password_confirmation: "kickhash",
        email: "kick@hash.com"
      }
      )
    end
    it "render edit view" do
      get :edit, id: trainer.id
      expect( response ).to render_template :edit
    end

    it "assigns the trainer to @trainer" do
      get :edit, id: trainer.id
      expect( assigns(:trainer) ).to eq( trainer )
    end

  end

  #create
  describe "POST #create" do
    context "when there are vaild params" do
      let( :valid_trainer_params ) do
        {
          trainer: {
            name: "ash",
            password: "kickhash",
            password_confirmation: "kickhash",
            email: "kick@hash.com"
          }
        }
      end

      it "creates new trainer" do
        expect { post :create, valid_trainer_params }.to change {Trainer.count}
      end

      it "redirects to new trainer" do
        post :create, valid_trainer_params
        expect( response ).to redirect_to Trainer.last
      end
    end
    context "when there are invalid params" do
      let(:invalid_trainer_params) do
        {}
      end

      it "renders the new page" do
        post :create, invalid_trainer_params
        expect(response).to render_template(:new)
      end
      it "does not create new trainer" do
        expect { post :create, valid_trainer_params }.to change {Trainer.count}.by(0)
      end

    end
  end
  #update
  #destroy




end
