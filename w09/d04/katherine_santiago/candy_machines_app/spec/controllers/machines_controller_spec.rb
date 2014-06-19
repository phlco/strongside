require 'spec_helper'

describe MachinesController do

  describe 'GET index' do
    it "requires the index view" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns all machines as @machines" do
      machine = Machine.new
      machine.location = "hawaii"
      machine.owner_id = 1
      machine.save

      get :index
      expect(assigns(:machines)).to eq([machine])
    end
  end

  describe 'GET #show' do

    let(:machine) do
      Machine.create(
        location: "hawaii",
        owner_id: 2
        )
    end

    it "renders the show view" do
      get :show, id: machine.id
      expect(response).to render_template :show
    end

    it "assigns particular machine as @machine" do
      get :show, id: machine.id
      expect(assigns(:machine)).to eq(machine)
    end
  end

  describe 'GET #new' do

    it "renders the new view" do
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new trainer to @trainer" do
      get :new
      expect(assigns(:machine)).to be_a_new(Machine)
    end
  end

  describe 'GET #edit' do

    let(:machine) do
      Machine.create(
        location: "NY",
        owner_id: 3
        )
    end

  end

end