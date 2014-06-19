require 'spec_helper'

describe MachinesController do

  let (:owner) do
    Owner.create()
  end

  let(:machine) do
    Machine.create(
      location: "902 Broadway",
      owner_id: owner.id
      )
  end

  describe "GET #INDEX" do
    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns machines as @machines" do
      machine
      get :index
      machines_array = []
      machines_array << machine
      assigns(:machines).should eq(machines_array)
    end
  end

  describe "GET #show" do
    it "renders the show page" do
      get :show, id: machine.id
      expect(response).to render_template :show
    end
    it "shows the machine that you assigned as @machine" do
      get :show, id: machine.id
      assigns(:machine).should eq(machine)
    end
  end

  describe "GET #new" do
    it "renders the new page" do
      get :new
      expect(response).to render_template :new
    end

    it "shows the new machine" do
      get :new
      assigns(:machine).should be_a_new(Machine)
    end
  end

  describe "GET #edit" do
    it "renders the edit page" do
      get :edit, id: machine.id
      expect(response).to render_template :edit
    end #this checks to make sure the view pages are created

    it "assigns @machine to machine" do
      get :edit, id: machine.id
      assigns(:machine).should eq(machine)
    end
  end

  describe "POST #create" do

    let(:valid_params) do
      { machine: {
        location: "902 Broadwayy"}
      }
    end

    it "redirects to the new machine page" do
      post :create, valid_params
      expect(response).to redirect_to Machine.last
    end

    it "creates a new machine" do

      expect{post:create, valid_params}.to change{Machine.count}.by(1)
    end

    context "invalid params" do
      let(:invalid_params) do
        {}
      end

      it "renders the new page" do
        post :create, invalid_params
        expect(response).to render_template :new
      end

      it "does not create new machine" do
        expect{post:create, invalid_params}.to change{Machine.count}.by(0)
      end
    end


    describe "PUT #UPDATES" do
      let(:valid_params) do
        {
          location: "800 Broadway"
        }
      end

      it "redirects to the machine if successful" do
        put :update, id: machine.id, :machine => valid_params
        expect(response).to redirect_to Machine.find(machine.id)
      end

      it "updates the machine" do
        put :update, id: machine.id, :machine => valid_params
        expect(Machine.find(machine.id).location).to eq("800 Broadway")
      end

      context "invalid params are submitted" do
        let(:invalid_params) do
          {money: "gg"}
        end

        it "redirects back to edit" do
          put :update, id: machine.id, :machine => invalid_params
          expect(response).to render_template :edit
        end
      end
    end

    describe "#destroy" do
      it "destroy the machine" do
        machine
        delete :destroy, id: machine.id
        expect(Machine.exists?(machine.id)).to be_false
      end #need to fix

      it "redirects back to index" do
        delete :destroy, id: machine.id
        expect(response).to redirect_to(machines_path)
      end
    end
  end
end