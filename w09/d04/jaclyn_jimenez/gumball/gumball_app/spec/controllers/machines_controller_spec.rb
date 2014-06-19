require 'spec_helper'

describe MachinesController do

  #index
  describe "GET #index" do

    it "responds to index" do
      get :index
      response.should render_template :index
    end
    #get all the machines
    it "assigns all the machines as @machines" do
      machine = Machine.create({location: "902 broadway", candy_price: 0.25, owner_id: 1})
      get :index
      assigns(:machines).should eq([machine])
    end
  end

  #show

  describe "GET #show" do
    let( :machine ) do
      Machine.create({location: "902 broadway", candy_price: 0.25, owner_id: 1})
    end
    it "renders the show view" do
      get :show, id: machine.id
      expect( response ).to render_template :show
    end
    it "assigns the machine to @machine" do
      get :show, id: machine.id
      expect( assigns(:machine) ).to eq( machine )
    end

  end

  #new

  describe "GET #new" do
    it "renders the new view" do
      get :new
      expect( response ).to render_template :new
    end
    it "assigns new machine to @machine" do
      get :new
      expect( assigns(:machine) ).to be_a_new( Machine )
    end
  end
  #edit
  describe "GET #edit" do
    let( :machine ) do
      Machine.create({location: "902 broadway", candy_price: 0.25, owner_id: 1})
    end
    it "render edit view" do
      get :edit, id: machine.id
      expect( response ).to render_template :edit
    end

    it "assigns the machine to @machine" do
      get :edit, id: machine.id
      expect( assigns(:machine) ).to eq( machine )
    end

  end

  #create
  describe "POST #create" do
    context "when there are vaild params" do
      let( :valid_machine_params ) do
        {
          machine: {location: "902 broadway", candy_price: 0.25, owner_id: 1}
        }
      end

      it "creates new machine" do
        expect { post :create, valid_machine_params }.to change {Machine.count}
      end

      it "redirects to new machine" do
        post :create, valid_machine_params
        expect( response ).to redirect_to Machine.last
      end
    end
    context "when there are invalid params" do
      let(:invalid_machine_params) do
        {:machine => {}}
      end

      it "renders the new page" do
        post :create, invalid_machine_params
        expect( response ).to render_template :new
      end
      it "does not create new machine" do
        expect { post :create, invalid_machine_params }.to change {Machine.count}.by(0)
      end
    end
  end
  #update
  describe "#post update" do
    context "when there are vaild params" do
      before(:each) do
        @test_machine = Machine.create({location: "902 broadway", candy_price: 0.25, owner_id: 1})
        @location = "21 union sq west"
      end
      it "updates the machine" do
        expect{ post :update, :id => @test_machine.id, :machine => {:location => @location} }.to be{Machine.find_by_id(@test_machine.id).location}
      end
    end
  end
  #destroy
  describe "POST #destroy" do
    context "when there are vaild params" do
      before(:each) do
        @machine = Machine.create({location: "902 broadway", candy_price: 0.25, owner_id: 1})
      end
      it "deletes the entry at given ID" do
        expect { delete :destroy, id: @machine.id }.to change{Machine.all.length}.by(-1)
      end
    end
  end

end
