require 'spec_helper'

describe TrainersController do
  let(:trainer) { Trainer.create( email: 'coopermayne@gmail.com',
                              password: '32323232',
                              password_confirmation: '32323232') }

  describe 'GET #index' do
    it 'assigns all the trainers to @trainers' do
      trainers_array = []
      trainers_array << trainer
      get :index
      assigns(:trainers).should match_array(trainers_array)
    end

    it "renders the index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it "renders the index view" do
      get :show, id: trainer.id
      expect(response).to render_template('show')
    end

    it 'assigns trainer with param id to @trainer' do
      get :show, id: trainer.id
      assigns(:trainer).should eq(trainer)
    end

  end

  describe 'GET #new' do
    it "renders the new view" do
      get :new
      expect(response).to render_template('new')
    end

    it "assigns new trainer to @trainer" do
      get :new
      assigns(:trainer).should be_a_new(Trainer)
    end
  end

  describe "GET #edit" do
    it "renders edit view" do
      get :edit, id: trainer.id
      expect(response).to render_template('edit')
    end

    it 'assinged params trainer to @trainer' do
      get :edit, id: trainer.id
      assigns(:trainer).should eq(trainer)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do

      let(:valid_params) do
        { email: 'coopermayne@gmail.com',
          password: '32323232',
          password_confirmation: '32323232' }
      end

      it "tries to save the trainer sent in params" do
        expect{ post :create, trainer: valid_params }.to change { Trainer.all.count }.by 1
      end

      it "redirects to @trainer show if success" do
        post :create, trainer: valid_params 
        response.should redirect_to(assigns(:trainer))
      end
    end

    context "when invalid params are passed" do

      let(:valid_params) do
        { email: 'coopermayne@gmail.com',
          password: '32323232',
          password_confirmation: '32323232' }
      end

      it "renders new if trainer save fails" do
        post :create, trainer: invalid_params 
        response.should render_template :new
      end
    end
  end

  describe "DELETE #destroy" do
    it "delete trainer with id from params" do
      trainer
      expect{ delete :destroy, id: trainer.id }.to change{ Trainer.all.count }.by -1
    end

    it "redirects to tariners index" do
      delete :destroy, id: trainer.id 
      expect(response).to redirect_to '/trainers'
    end
  end

  describe "PUT #update" do

    context "when valid params are passed" do
      let(:valid_update_params) { { name: "what what" } }

      it "should update trainers stuff" do
        put :update, id: trainer.id, trainer: valid_update_params
        trainer.reload
        expect(trainer.name).to eq("what what")
      end

      it "should redirect to trainers show page" do
        put :update, id: trainer.id, trainer: valid_update_params
        expect(response).to redirect_to '/trainers'
      end
    end

    context "when invalid params are passed" do
      let(:invalid_update_params) do
        { password: '32',
          password_confirmation: '32323232' }
      end

      it "should redirect to show page" do
        put :update, id: trainer.id, trainer: invalid_update_params
        expect(response).to render_template('edit')
      end

      it "should send error message"
    end
  end
end
