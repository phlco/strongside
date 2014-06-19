require 'spec_helper'

#       thing.should === expect(thing).to


describe TrainersController do


  describe 'GET #index' do

    it "renders the index view" do
      get :index

      # response.should render_template :index
      expect(response).to render_template :index


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

      # assigns(:trainers).should match_array(trainers_array)
      expect( assigns(:trainers) ).to match_array(trainers_array)
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
      # thing.should === expect(thing).to

      expect(response).to render_template :show
    end

    it "assigns the trainer to @trainer" do
      get :show, id: trainer.id
      expect( assigns(:trainer) ).to eq(trainer)
    end

  end

  describe 'GET #new' do

    it "renders the 'new' view " do
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new trainer to @trainer" do
      get :new
      expect( assigns(:trainer) ).to be_a_new( Trainer )
    end

  end

  describe 'GET #edit' do

    let(:trainer) do
      Trainer.create(
        password: "kickhash",
        password_confirmation: "kickhash",
        email: "me@jonl.org"
      )
    end

    it "renders the 'edit' view" do
      get :edit, id: trainer.id
      expect(response).to render_template(:edit)
    end

    it "assigns the trainer to @trainer" do
      get :edit, id: trainer.id

      expect( assigns(:trainer) ).to eq(trainer)
    end

  end

  describe "POST #create" do

    context "when there are valid params" do

      let(:valid_trainer_params) do
        {
          password: "kickhash",
          password_confirmation: "kickhash",
          email: "me@jonl.org"
        }
      end

      it "redirects to the new trainer" do
        post :create, trainer: valid_trainer_params

        expect( response ).to redirect_to Trainer.last
      end

      it "creates a new trainer" do
        # what are we expecting to increase by integer 1
        expect {  post :create, trainer: valid_trainer_params }.to change { Trainer.count }.by(1)
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

      it "create a new trainer" do
        expect { post :create, invalid_trainer_params }.to change { Trainer.count }.by(0)
      end

    end

  end

  describe 'PUT #update' do

    let(:trainer) do
      Trainer.create(
        password: "kickhash",
        password_confirmation: "kickhash",
        email: "me@jonl.org"
      )
    end

    context "when there are valid params" do

      let(:valid_trainer_params) do
        {
          password: "newpassword",
          password_confirmation: "newpassword",
          email: "new@email.org"
        }
      end

      it "redirects to the new trainer" do
        put :update, id: trainer.id, trainer: valid_trainer_params

        expect( response ).to redirect_to trainer
      end

      it "updates the proper trainer" do
        put :update, id: trainer.id, trainer: valid_trainer_params

        trainer.reload
        expect( trainer.email ).to eq("new@email.org")
      end

    end

    context "when there are invalid params" do

      let(:invalid_trainer_params) do
        {
          email: nil
        }
      end

      it "renders the edit page" do
        put :update, id: trainer.id, trainer: invalid_trainer_params
        expect( response ).to render_template(:edit)
      end

      it "does not update the trainer" do
        post :update, id: trainer.id, trainer: invalid_trainer_params
        prev_update_time = trainer.updated_at
        trainer.reload
        expect( prev_update_time ).to eq( trainer.updated_at )
      end

    end

  end

  describe 'DELETE #destroy' do

    let!(:trainer) do
      Trainer.create(
        password: "kickhash",
        password_confirmation: "kickhash",
        email: "me@jonl.org"
      )
    end

    it "deletes the trainer" do
      expect { delete :destroy, id: trainer.id }.to change{ Trainer.count }.by(-1)
    end

    it 'redirects to trainers#index' do
      delete :destroy, id: trainer.id
      expect( response ).to redirect_to trainers_path
    end

  end

  # /trainers/4/edit


  # index


  # show
  # new
  # edit
  # create

  # update
  # destroy

end
