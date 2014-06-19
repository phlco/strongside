require 'spec_helper'

describe TrainersController do

  describe "GET #index" do
    # this tests that the view will render from this route
    it "renders the index view" do
      get :index
      # response.should render_template :index
      expect(response).to render_template :index
    end
    # goal of this test is to get all of the trainers from the database
      # should be returned as an array @trainers -> [<trainer1>, <trainer2>]
    it "assigns all trainers to @trainers" do
      # must create a new trainer in the database to be able to retrieve a trainer from the database
      trainer = Trainer.new
      trainer.password = "kickhash"
      trainer.password_confirmation = "kickhash"
      trainer.email = "kick@hash.com"
      trainer.save
      # make call
      get :index
      trainers_array = []
      trainers_array << trainer

      # assigns(:trainers).should eq(trainers_array)
      # more precise test
      # OLD METHOD assigns(:trainers).should match_array(trainers_array)
      expect(assigns(:trainers)).to match_array(trainers_array)
    end
  end

  describe "GET #show" do
    let(:trainer) do
      Trainer.create(
        password: "kickhash",
        password_confirmation: "kickhash",
        email: "@jonl.org"
      )
    end

    it "renders the show view" do
    # need to pass the :id parameter to show (actual path is: /trainer/1)
      get :show, id: trainer.id
      expect(response).to render_template :show
    end

    it "assigns the trainer to @trainer" do
      get :show, id: trainer.id
      expect(assigns(:trainer)).to eq(trainer)
    end
  end

  describe "GET #new" do

    it "renders to new view" do
  # need to pass the :id parameter to new (actual path is: /trainer/1)
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new trainer to @trainer" do
      get :new
      expect(assigns(:trainer)).to be_a_new(Trainer)
    end

  end

  describe "GET #edit" do

    let(:trainer) do
      Trainer.create(
        password: "kickhash",
        password_confirmation: "kickhash",
        email: "@jonl.org"
      )
    end

    it "renders to edit view" do
  # need to pass the :id parameter to edit (actual path is: /trainer/1)
      get :edit, id: trainer.id
      expect(response).to render_template(:edit)
    end

    it "assigns the trainer to @trainer" do
      get :edit, id: trainer.id
      expect( assigns(:trainer) ).to eq(trainer)
    end

  end

  describe "POST #create" do

    context "valid trainer params" do

      let(:valid_trainer_params) do
        {
          trainer: {
            password: "kickhash",
            password_confirmation: "kickhash",
            email: "me@jonl.org"
          }
        }
      end

      it "redirects to the new trainer" do
        post :create, valid_trainer_params
        # use Trainer.last in next test because this trainer was the most recent one in the database and will thus be last
        expect(response).to redirect_to(Trainer.last)
      end

      it "creates a new trainer" do
        expect{ post :create, valid_trainer_params}.to change{ Trainer.count }.by(1)
      end

    end

    context "when there are invalid params" do
      let(:invalid_trainer_params) do
        {}
      end

      it "renders the new page" do
        post :create, invalid_trainer_params
        # use Trainer.last in next test because this trainer was the most recent one in the database and will thus be last
        expect(response).to render_template(:new)
      end

      it "does not creates a new trainer" do
        expect
      end

    end
  end

end
