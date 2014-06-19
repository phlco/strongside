require 'spec_helper'

describe LambsController do

  describe "GET #index" do

    it "responds to index" do
      get :index
      response.should render_template :index
    end

    it "makes a new lamb" do
      get :index
      expect( assigns(:lamb) ).to be_a_new Lamb
    end

    it "lists lambs" do
      Lamb.delete_all
      lamb = Lamb.create
      get :index
      assigns(:lambs).should eq([lamb])
    end

  end

 describe "POST #create" do

     it "creates new Lamb" do
       expect { post :create }.to change {Lamb.count}
     end

    it "sends back json" do
       post :create
       content_type = response.headers['Content-Type']
       expect( content_type ).to match("application/json")
     end

  end

  describe "PUT #update" do

    it "sets is_silent to false" do
      lamb = Lamb.create
      put :update, id: lamb.id
      lamb.reload
      expect(lamb.is_silent).to be_false

    end

  end


end
