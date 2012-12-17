class GamesController < ApplicationController
  # GET /games
  # GET /games.json
  def index
    @date = ""
    @games = Game.order("created_at desc").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:game])  
    @game.errors = []
    if params[:player_one] == params[:player_two]
      @game.errors.push("Players must be different")
    end
    if params[:results][:player_one_winner] == params[:results][:player_two_winner]
      @game.errors.push("Please select a winner")
    end

      respond_to do |format|
        if @game.save && @game.errors == []
          @game.results.create! player_id: params[:player_one], winner: params[:results][:player_one_winner], score: params[:results][:player_one_score], opponent_id: params[:player_two]
          @game.results.create! player_id: params[:player_two], winner: params[:results][:player_two_winner], score: params[:results][:player_two_score], opponent_id: params[:player_one]
          format.html { redirect_to games_path, notice: 'Game successfully created.' }
          format.json { render json: @game, status: :created, location: @game }
        else
          format.html { render action: "new" }
          format.json { render json: @game.errors, status: :unprocessable_entity }
        end
      end
    end
  

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end
end
