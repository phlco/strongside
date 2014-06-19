require 'spec_helper'

#thing.should === expect(thing).to

describe OwnersController do

  describe 'GET #index' do

    it "renders the index view" do
      get :index
      # response.should render_template :index
      expect(response).to render_template :index
    end

    it "assigns all the owners as @owners" do
      # get all the owners
      # @owners -> [<Owner1>, <Owner2>]
      owner = Owner.new
      owner.save

      get :index

      owners_array = []
      owners_array << owner

      # assigns(:owners).should match_array(owners_array)
      expect(assigns(:owners)).to match_array(owners_array)
    end
  end # GET #index

  describe 'GET #show' do

    let(:owner) do
      Owner.create
    end

    it "renders the show view" do
      # line below needs a specific owner id
      get :show, id: owner.id
      expect(response).to render_template :show
    end
  end # describe GET #show

  describe 'POST #create' do
    context "when params are valid" do
      let(:valid_owner_attributes) do
        {
          owner: {}
        }
      end

      it "persists a new owner to the db" do
        expect {post :create, valid_owner_attributes }.to change{Owner.count}.by(1)
      end

      it "redirects to the new owner's show page" do
        post :create, valid_owner_attributes
        expect(response).to redirect_to(Owner.last)
      end

    end # when params are valid

    # Travis, you didn't do this because you set irreplaceable defaults on owner
    # context "when params are invalid" do
    #   let(:invalid_owner_params) do
    #     {
    #       owner: { money: "Marpdarp"}
    #     }
    #   end

    #   it "renders the edit template" do
    #     post :create, invalid_owner_params
    #     expect(response).to render_template :edit
    #   end
    # end # when params are invalid
  end # POST #create



  # describe 'GET #edit' do

  # end
end # describe OwnersController
