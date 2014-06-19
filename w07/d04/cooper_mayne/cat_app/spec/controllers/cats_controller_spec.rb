require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CatsController do

  # This should return the minimal set of attributes required to create a valid
  # Cat. As you add validations to Cat, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CatsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all cats as @cats" do
      cat = Cat.create! valid_attributes
      get :index, {}, valid_session
      assigns(:cats).should eq([cat])
    end
  end

  describe "GET show" do
    it "assigns the requested cat as @cat" do
      cat = Cat.create! valid_attributes
      get :show, {:id => cat.to_param}, valid_session
      assigns(:cat).should eq(cat)
    end
  end

  describe "GET new" do
    it "assigns a new cat as @cat" do
      get :new, {}, valid_session
      assigns(:cat).should be_a_new(Cat)
    end
  end

  describe "GET edit" do
    it "assigns the requested cat as @cat" do
      cat = Cat.create! valid_attributes
      get :edit, {:id => cat.to_param}, valid_session
      assigns(:cat).should eq(cat)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Cat" do
        expect {
          post :create, {:cat => valid_attributes}, valid_session
        }.to change(Cat, :count).by(1)
      end

      it "assigns a newly created cat as @cat" do
        post :create, {:cat => valid_attributes}, valid_session
        assigns(:cat).should be_a(Cat)
        assigns(:cat).should be_persisted
      end

      it "redirects to the created cat" do
        post :create, {:cat => valid_attributes}, valid_session
        response.should redirect_to(Cat.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cat as @cat" do
        # Trigger the behavior that occurs when invalid params are submitted
        Cat.any_instance.stub(:save).and_return(false)
        post :create, {:cat => {  }}, valid_session
        assigns(:cat).should be_a_new(Cat)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Cat.any_instance.stub(:save).and_return(false)
        post :create, {:cat => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested cat" do
        cat = Cat.create! valid_attributes
        # Assuming there are no other cats in the database, this
        # specifies that the Cat created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Cat.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => cat.to_param, :cat => { "these" => "params" }}, valid_session
      end

      it "assigns the requested cat as @cat" do
        cat = Cat.create! valid_attributes
        put :update, {:id => cat.to_param, :cat => valid_attributes}, valid_session
        assigns(:cat).should eq(cat)
      end

      it "redirects to the cat" do
        cat = Cat.create! valid_attributes
        put :update, {:id => cat.to_param, :cat => valid_attributes}, valid_session
        response.should redirect_to(cat)
      end
    end

    describe "with invalid params" do
      it "assigns the cat as @cat" do
        cat = Cat.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Cat.any_instance.stub(:save).and_return(false)
        put :update, {:id => cat.to_param, :cat => {  }}, valid_session
        assigns(:cat).should eq(cat)
      end

      it "re-renders the 'edit' template" do
        cat = Cat.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Cat.any_instance.stub(:save).and_return(false)
        put :update, {:id => cat.to_param, :cat => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cat" do
      cat = Cat.create! valid_attributes
      expect {
        delete :destroy, {:id => cat.to_param}, valid_session
      }.to change(Cat, :count).by(-1)
    end

    it "redirects to the cats list" do
      cat = Cat.create! valid_attributes
      delete :destroy, {:id => cat.to_param}, valid_session
      response.should redirect_to(cats_url)
    end
  end

end
