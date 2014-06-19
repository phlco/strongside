require 'spec_helper'

describe MachinesController do

  before(:each) do
    @owner = Owner.create
    @machine = Machine.new
    @machine.location = 'somewhere'
    @machine.owner_id = @owner.id
    @machine.save
  end

  describe 'GET #index' do
    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns all the machines as @machines" do
      get :index
      machines_array = []
      machines_array << @machine
      expect( assigns(:machines) ).to match_array(machines_array)
    end
  end

  # describe "GET #show" do
  #   let(:machine) { Machine.create }
  #   it "renders the show view" do
  #     get :show, id: machine.id

  #     expect(response).to render_template :show
  #   end

  #   it "assigns the machine to @machine" do
  #     get :show, id: machine.id
  #     expect( assigns(:machine) ).to #something
  #   end
  # end


  describe "GET #show" do
    it "renders the show view" do
      get :show, id: @machine.id
      expect(response).to render_template :show
    end
  end


  describe 'GET #new' do

    it "renders the 'new' view" do
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new machine to @machine" do
      get :new
      expect( assigns(:machine) ).to be_a_new( Machine )
    end
  end

  describe "GET #edit" do

    it "renders the 'edit' view" do
      get :edit, id: @machine.id
      expect(response).to render_template :edit
    end

  end

  # update

  describe "POST #create" do

    context "when there are valid params" do
      before(:each) do
        @valid_machine_params = {
          machine: {
            location: "elsewhere",
            owner_id: @owner.id
          }
        }
      end

      it "redirects to the new machine" do
        post :create, @valid_machine_params
        expect( response ).to redirect_to Machine.last
      end

      it "creates a new machine" do
        expect { post :create, @valid_machine_params }.to change { Machine.count }.by(1)
      end
    end

    context "when there are invalid params" do
      before(:each) do
        @invalid_machine_params = {}
      end

      it "redirects to the new machine" do
        post :create, @invalid_machine_params
        expect( response ).to render_template(:new)
      end

      it "creates a new machine" do
        expect { post :create, @invalid_machine_params }.to change { Machine.count }.by(0)
      end
    end


  end
  # destroy

end
