require 'spec_helper'

describe TrainersController do

  describe 'GET #index' do

    it "renders the index view" do
      get :index

      response.should render_template :index
    end

    it "assigns all the trainers as @trainers" do
      # get all the trainers
      # @trainers -> [<Trainer1>, <Trainer2>]

      trainer = Trainer.new
      trainer.password = "kickhash"
      trainer.password_confirmation = "kickhash"
      trainer.email = "kick@hash.com"
      trainer.save

      get :index

      trainers_array = []
      trainers_array << trainer

      assigns(:trainers).should eq(trainers_array)
    end

  end

  describe 'GET #show' do
    # /trainers/4

    let(:trainer) do
      Trainer.create(
        password: "kickhash",
        password_confirmation: "kickhash",
        email: "me@jonl.org"
        )
    end

    it "renders the show view" do
      get :show, id: trainer.id
      expect(response).to render_template :show
    end

    it "assigns particular trainer as @trainer" do
      get :show, id: trainer.id
      expect( assigns(:trainer) ).to eq(trainer)
    end

  end

  describe 'Get #new' do
    # /trainers/new
    it "renders the new view" do
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new trainer to @trainer" do
      get :new
      expect( assigns(:trainer) ).to be_a_new( Trainer )
    end

  end

  describe 'Get #edit' do
    # /trainer/id/edit

    let(:trainer) do
      Trainer.create(
        password: "kickhash",
        password_confirmation: "kickhash",
        email: "me@jonl.org"
        )
    end

    it "renders the edit view" do
      get :edit, id: trainer.id
      expect(response).to render_template :edit
    end

    it "assigns a trainer to @trainer" do
      get :edit, id: trainer.id
      expect( assigns(:trainer) ).to eq(trainer)
    end

  end

  describe 'POST #create' do

    context "when there are valid params"
      let(:valid_trainer_params) do
        valid_trainer_params = {
          trainer = {
            password: "kickhash",
            password_confirmation: "kickhash",
            email: "me@jonl.org"
          }
        }
      end

      it "redirects to the new trainer" do
        post :create, valid_trainer_params
        expect( response ).to redirect_to Trainer.last
      end

      it "creates a new trainer" do

        post :create, trainer_params
        # expect(Trainer.last.email).to be("me@jonl.org")
        expect { post :create, valid_trainer_params }.to change { Trainer.count }.by(1)
      end
    end

    context "when there are invalid params" do
      let(:invalid_trainer_params) do
        {}
      end

      it "renders the new page" do
        post :create, invalid_trainer_params
        expect( response ).to render_template(:new)
      end

      it "creates a new trainer" do
        expect { post :create, invalid_trainer_params}.to change { Trainer.count }.by(0)
      end
    end
  end

  describe 'PUT #update' do

    before :each do
      @trainer = Trainer.create(password: "kickhash1", password_confirmation: "kickhash1", email: "new@jonl.org")
    end

    context "valid attributes" do

      it "located the requested @trainer" do
        put :update, id: @trainer.id
        expect(assigns(:trainer)).to eq(@trainer)
      end

      it "changes @trainer's attributes" do
        put :update, id: @trainer.id
        @trainer.email = "new@jonl.org"
        expect(assigns(:trainer[:email]).to eq("new@jonl.org")
      end

      it "redirects to updated trainer" do
        put :update, id: @trainer, trainer: Factory.attributes_for(:trainer)
        expect(response).to redirect_to @trainer
      end
    end

    context "invalid attributes" do
      it "locates the requested @trainer" do
        put :update, id: @trainer, trainer: Factory.attributes_for(:invalid_trainer_params)
        expect(assigns(:trainer)).to eq(@trainer)
      end

      it "does not change @trainer's attributes" do
        put :update, id: @trainer, trainer: Factory.attributes_for(:trainer, password: "kickhash1", password_confirmation: nil, email: "new@jonl.org")
        @trainer.reload
        expect(@trainer.password).to_not eq("kickhash1")
        expect(@trainer.password_confirmation).to_not eq("kickhash1")
        expect(@trainer.email).to_not eq("new@jonl.org")
      end

      it "re-renders the edit method" do
        put :update, id: @trainer, trainer: Factory.attributes_for(:invalid_trainer_params)
        expect(response).to render_template :edit
      end
    end

  end

  # update
  # destroy

end