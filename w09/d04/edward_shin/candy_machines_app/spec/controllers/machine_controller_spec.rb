require 'spec_helper'

describe MachinesController do

  describe 'GET #index' do

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns all machines as @machines" do
      machine = Machine.new
      machine.owner_id = 1
      machine.location = "hawaii"
      machine.save

      get :index

      expect(assigns(:machines)).to eq([machine])

    end

  end

  describe 'GET #show' do

    let(:owner) do
      Owner.create
    end

    let(:machine) do
      Machine.create(
        owner_id: owner.id,
        location: "hawaii"
        )
    end

    it "renders the show view" do
      get :show, id: machine.id
      expect(response).to render_template :show
    end

    it "assigns the machine to @machine" do
      get :show, id: machine.id
      expect(assigns(:machine)).to eq(machine)
    end

  end

  describe 'GET #new' do

    it "renders a new view" do
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new machine to @machine" do
      get :new
      expect(assigns(:machine)).to be_a_new( Machine )
    end

  end

  describe 'GET #edit' do

    let(:owner) do
      Owner.create
    end

    let(:machine) do
      Machine.create(
        owner_id: owner.id,
        location: "hawaii"
        )
    end

    it "renders the edit view" do
      get :edit, id: machine.id
      expect(response).to render_template :edit
    end

    it "assigns machine to @machine" do
      get :edit, id: machine.id
      expect(assigns(:machine)).to eq(machine)
    end

  end

  describe 'POST #create' do

    context "when there are valid params" do

      let(:owner) do
        Owner.create
      end

      let(:valid_machine_params) do
        {
          machine: {
            owner_id: owner.id,
            location: "hawaii"
          }
        }
      end

      it "rediects to new machine" do
        post :create, valid_machine_params
        expect(response).to render_template Machine.last
      end

      it "creates a new machine" do
        expect { post :create, valid_machine_params }.to change { Machine.all.length }.by(1)
      end

    end

    context "when there are invalid params" do

      let(:invalid_machine_params) do
        {}
      end

      it "renders the new page" do
        post :create, invalid_machine_params
        expect(response).to render_template :new
      end

      it "create a new machine" do
        expect { post :create, invalid_machine_params }.to change { Machine.count }.by(0)
      end

    end

  end

  describe 'PUT #update' do
    let(:owner) do
      Owner.create
    end

    let(:machine) do
      Machine.create(owner_id: owner.id, location: "hawaii")
    end

    before(:each) do
      @params = {
        id: machine.id,
        location: machine.location
      }
    end

    it "renders a show page when valid params" do
      put :update, @params
      expect(response).to render_template :show
    end

  end


end