require 'spec_helper'

describe TrainersController do
  let(:trainer) do
      Trainer.create(
        password: "kickhash",
        password_confirmation: "kickhash",
        email: "kick@hash.com"
        )
    end

  it "renders the index view" do
    get :index
    response.should render_template :index
  end

  describe 'GET #index' do
    it "assigns all the trainers as @trainers" do
      # trainer = Trainer.new
      # trainer.password = "kickhash"
      # trainer.password_confirmation = "kickhash"
      # trainer.email = "kick@hash.com"
      # trainer.save
      trainer #need to actually reference it for it to appear on the index page!

      get :index

      trainers_array = []
      trainers_array << trainer

      assigns(:trainers).should eq(trainers_array)
    end
  end


  describe 'GET #show' do
    it "renders the show view" do
      get :show, id: trainer.id
      # response.should render_template :show
      expect(response).to render_template :show
    end


    it "shows the trainer that you assigned as @trainer" do
      get :show, id: trainer.id
      assigns(:trainer).should eq(trainer)
    end
  end

  describe 'GET #new' do
    it "renders the new view" do
      get :new
      expect(response).to render_template :new
    end
    it "show the new trainer" do
      get :new
      assigns(:trainer).should be_a_new(Trainer)
    end
  end

  describe 'GET #edit' do

    it "renders the edit view" do
      get :edit, id: trainer.id
      expect(response).to render_template :edit
    end

    it "show the trainer edit page that you assigned as @trainer" do
      get :edit, id: trainer.id
      assigns(:trainer).should eq(trainer)
    end
  end

  describe 'GET #create' do
    let(:valid_trainer_params) do
      {trainer: {
        password: "kickhash",
        password_confirmation: "kickhash",
        email: "kick@hash.com"
        }
      }
    end

    it "redirects to the new trainer" do
      post :create, valid_trainer_params
      expect(response).to redirect_to Trainer.last
    end

    it "creates a new trainer" do
      expect{post :create, valid_trainer_params}.to change {Trainer.count}.by(1)
    end


    context "when there are invalid params" do
      let(:invalid_trainer_params) do {

      }
      end

      it "renders the new page" do
        post :create, invalid_trainer_params
        expect(response).to render_template(:new)
      end


      it "does not create a new trainer" do
        expect{post :create, invalid_trainer_params}.to change {Trainer.count}.by(0)
      end
    end
  end

  describe "PUT :id #update" do

    let(:trainer_params) do
      {
        password: "kickhash",
        password_confirmation: "kickhash",
        email: "kicker@hash.com"
      }
    end

    # why doesnt this work??
    # let(:trainer_params2) do
    #   {trainer: {
    #     password: "kickhash",
    #     password_confirmation: "kickhash",
    #     email: "kick@hash.com"
    #     }
    #   }
    # end
    # attr => trainer

    # it "redirects to the trainer" do
    #   put :update, id: trainer.id, trainer_params2
    #   expect(response).to redirect_to Trainer.find(trainer.id)
    # end #doesnt work why??

    it "redirects to the trainer if successful" do
      put :update, id: trainer.id, :trainer => trainer_params
      expect(response).to redirect_to Trainer.find(trainer.id)
    end  # works

    it "creates a new trainer" do
      put :update, id: trainer.id, :trainer => trainer_params
      expect(Trainer.find(trainer.id).email).to eq("kicker@hash.com")
    end

    context "invalid params are submitted" do
      let(:invalid_params) do
        {
          password: "kickhasher",
          password_confirmation: "kickhash",
        }
      end

      it "redirects back to edit" do
        put :update, id: trainer.id, :trainer => invalid_params
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "#destroy" do


    it "destroys the trainer" do
      delete :destroy, id: trainer.id
      # expect{delete :destroy, id: trainer.id}.to change{:trainer, :count}
      expect(Trainer.exists?(trainer.id)).to be_false
    end

    it "redirects back to index" do
      delete :destroy, id: trainer.id
      expect(response).to redirect_to(trainers_path)
      #COOL rails path works!!!
    end
  end
  # index
  # show
  # new
  # edit
  # update
  # create
  # destroy
end