
class KickhashesController < ApplicationController

  # GET /kickhashes/new
  # GET /kickhashes/new.json
  def new
    @kickhash = Kickhash.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: {email: nil, image_url: nil, name: nil}}
    end
  end

  # POST /kickhashes
  # POST /kickhashes.json
  def create
    @kickhash = Kickhash.new(params[:cat])

    respond_to do |format|
      if @kickhash.save
        format.html { redirect_to @kickhash, notice: 'Kickhash was successfully created.' }
        format.json { render json: @kickhash, status: :created, location: @kickhash }
      else
        format.html { render action: "new" }
        format.json { render json: @kickhash.errors, status: :unprocessable_entity }
      end
    end
  end




  # GET /kickhashes/1
  # GET /kickhashes/1.json
  def show
    @kickhash = Kickhash.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kickhash }
    end
  end

  # GET /kickhashes
  # GET /kickhashes.json
  def index
    @kickhashes = Kickhash.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kickhashes }
    end
  end




  # GET /kickhashes/1/edit
  def edit
    @kickhash = Kickhash.find(params[:id])
  end

  # PUT /kickhashes/1
  # PUT /kickhashes/1.json
  def update
    @kickhash = Kickhash.find(params[:id])

    respond_to do |format|
      if @kickhash.update_attributes(params[:kickhash])
        format.html { redirect_to @kickhash, notice: 'Kickhash was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kickhash.errors, status: :unprocessable_entity }
      end
    end
  end




  # DELETE /kickhashes/1
  # DELETE /kickhashes/1.json
  def destroy
    @kickhash = Kickhash.find(params[:id])
    @kickhash.destroy

    respond_to do |format|
      format.html { redirect_to kickhashes_url }
      format.json { head :no_content }
    end
  end

end
