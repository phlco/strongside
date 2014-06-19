require 'spec_helper'

describe MachinesController do
  let(:machine) { Machine.create( location: '123 abc df', owner_id: 1 ) }

  describe 'GET #index' do
    it 'assigns all the machines to @machines' do
      machines_array = []
      machines_array << machine
      get :index
      assigns(:machines).should match_array(machines_array)
    end

    it "renders the index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it "renders the index view" do
      get :show, id: machine.id
      expect(response).to render_template('show')
    end

    it 'assigns machine with param id to @machine' do
      get :show, id: machine.id
      assigns(:machine).should eq(machine)
    end

  end

  describe 'GET #new' do
    it "renders the new view" do
      get :new
      expect(response).to render_template('new')
    end

    it "assigns new machine to @machine" do
      get :new
      assigns(:machine).should be_a_new(Machine)
    end
  end

  describe "GET #edit" do
    it "renders edit view" do
      get :edit, id: machine.id
      expect(response).to render_template('edit')
    end

    it 'assinged params machine to @machine' do
      get :edit, id: machine.id
      assigns(:machine).should eq(machine)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do

      let(:valid_params) do
        { location: "asdf df d", owner_id: 1 }
      end

      it "tries to save the machine sent in params" do
        expect{ post :create, machine: valid_params }.to change { Machine.all.count }.by 1
      end

      it "redirects to @machine show if success" do
        post :create, machine: valid_params 
        response.should redirect_to(assigns(:machine))
      end
    end

    context "when invalid params are passed" do

      let(:invalid_params) do
        { location: "" }
      end

      it "renders new if machine save fails" do
        post :create, machine: invalid_params 
        response.should render_template :new
      end
    end
  end

  describe "DELETE #destroy" do
    it "delete machine with id from params" do
      machine
      expect{ delete :destroy, id: machine.id }.to change{ Machine.all.count }.by -1
    end

    it "redirects to tariners index" do
      delete :destroy, id: machine.id 
      expect(response).to redirect_to '/machines'
    end
  end

  describe "PUT #update" do

    context "when valid params are passed" do
      let(:valid_update_params) { { location: "lolo" } }

      it "should update machines stuff" do
        put :update, id: machine.id, machine: valid_update_params
        machine.reload
        expect(machine.location).to eq("lolo")
      end

      it "should redirect to machines show page" do
        put :update, id: machine.id, machine: valid_update_params
        expect(response).to redirect_to '/machines'
      end
    end

    context "when invalid params are passed" do
      let(:invalid_update_params) do
        {location: ""}
      end

      it "should redirect to show page" do
        put :update, id: machine.id, machine: invalid_update_params
        expect(response).to render_template('edit')
      end
    end
  end
end
