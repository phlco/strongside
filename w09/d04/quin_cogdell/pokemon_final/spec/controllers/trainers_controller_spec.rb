require 'spec_helper'

# index
# show
# new
# edit
# update
# destroy

describe TrainersController do

  describe 'GET #index' do

    it "renders the index view" do
      get :index
      # response.should render_template :index # old notation DO NOT USE
      expect(response).to render_template :index
    end

    it "assigns all the trainers as @trainers" do
      trainer = Trainer.new
      trainer.password = "kickhash"
      trainer.password_confirmation = "kickhash"
      trainer.email = "Kick@hash.com"
      trainer.save

      get :index

      trainers_array = []
      trainers_array << trainer

      # assigns(:trainers).should eq(trainers_array) # old notation DO NOT USE
      expect(assigns(:trainers)).to match_array(trainers_array)
    end
  end

  describe 'GET #show' do
    let(:trainer) do
      Trainer.create(
        password: "kickhash",
        password_confirmation: "kickhash",
        email: "qc@gmail.com"
        )
    end

    it "renders the show view" do
      # have to pass in the id or you will get a routing error
      # restful route is trainers/:id
      get :show, id: trainer.id
      expect(response).to render_template :show
    end

    it "assigns the trainer to @trainer" do
      get :show, id: trainer.id
      expect(assigns(:trainer)).to eq(trainer)
    end
  end

  describe 'GET #new' do

    it "renders the 'new' view" do
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new trainer to @trainer" do
      get :new
      expect(assigns(:trainer)).to be_a_new(Trainer)
    end

  end

  describe 'GET #edit' do

    let(:trainer) do
      Trainer.create(
        password: "kickhash",
        password_confirmation: "kickhash",
        email: "qc@gmail.com"
        )
    end

    it "renders #edit" do
      get :edit, id: trainer.id
      expect(response).to render_template :edit
    end

    it "assigns the trainer to @trainer" do
      get :edit, id: trainer.id
      expect(assigns(:trainer)).to eq(trainer)
    end
  end

  describe "POST #create" do

    context "when there are valid params" do

      let(:valid_trainer_params) do
              valid_trainer_params = {
          trainer: {
            password: "kickhash",
            password_confirmation: "kickhash",
            email: "qc@gmail.com"
            }
          }
      end

      it "creates a new trainer" do
        expect { post :create, valid_trainer_params }.to change { Trainer.count }.by(1)
      end

      it "redirects to the new trainer" do
        post :create, valid_trainer_params
        expect( response ).to redirect_to Trainer.last
      end
    end

    context "when there are invalid params" do
      let (:invalid_trainer_params) do
        {}
      end

      it "renders the new page" do
        post :create, invalid_trainer_params
        expect( response ).to render_template :new
      end

      it "creates a new trainer" do
        expect { post :create, invalid_trainer_params }.to change { Trainer.count }.by(0)
      end

    end


  end


end