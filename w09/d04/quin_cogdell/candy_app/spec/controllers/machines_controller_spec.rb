require 'spec_helper'


describe MachinesController do

  describe "GET #index" do

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end

    it "assings all the Machines as @machines" do
      machine = Machine.new
      machine.owner_id = 1
      machine.location = "NYC"
      machine.save

      get :index

      machines_array = []
      machines_array << machine

      expect(assigns(:machines)).to match_array(machines_array)
    end

  end

  describe 'GET #show' do
    let(:machine) do
      Machine.create(
        owner_id: 1,
        location: "NYC"
        )
    end

    it "renders the show view" do
      get :show, id: machine.id
      expect( response ).to render_template :show
    end

    it "assigns the machine to @machine" do
      get :show, id: machine.id
      expect( assigns(:machine)).to eq(machine)
    end
  end

  describe 'GET #new' do

    it "renders the 'new' view" do
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new machine to @machine" do
      get :new
      expect( assigns(:machine) ).to be_a_new(Machine)
    end

  end

end








end
