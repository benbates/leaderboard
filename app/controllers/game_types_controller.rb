class GameTypesController < ApplicationController
  # GET /game_types
  # GET /game_types.json
  def index
    @game_types = GameType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @game_types }
    end
  end

  # GET /game_types/1
  # GET /game_types/1.json
  def show
    @game_type = GameType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game_type }
    end
  end

  # GET /game_types/new
  # GET /game_types/new.json
  def new
    @game_type = GameType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game_type }
    end
  end

  # GET /game_types/1/edit
  def edit
    @game_type = GameType.find(params[:id])
  end

  # POST /game_types
  # POST /game_types.json
  def create
    @game_type = GameType.new(params[:game_type])

    respond_to do |format|
      if @game_type.save
        format.html { redirect_to @game_type, notice: 'Game type was successfully created.' }
        format.json { render json: @game_type, status: :created, location: @game_type }
      else
        format.html { render action: "new" }
        format.json { render json: @game_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /game_types/1
  # PUT /game_types/1.json
  def update
    @game_type = GameType.find(params[:id])

    respond_to do |format|
      if @game_type.update_attributes(params[:game_type])
        format.html { redirect_to @game_type, notice: 'Game type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_types/1
  # DELETE /game_types/1.json
  def destroy
    @game_type = GameType.find(params[:id])
    @game_type.destroy

    respond_to do |format|
      format.html { redirect_to game_types_url }
      format.json { head :no_content }
    end
  end
end
