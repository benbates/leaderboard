class PlayersController < ApplicationController
  # GET /players
  # GET /players.json
  def index
    @players = Player.all(:order => 'win_percent IS NULL, win_percent DESC, win_count DESC, points_for DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
    end
  end

    # GET /players.json
  def list
    @players = Player.all(:order => 'name ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
    end
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @player = Player.find(params[:id])
    @games = @player.games.order("created_at desc")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/new
  # GET /players/new.json
  def new
    @player = Player.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(params[:player])
    
    lastLadderPlayer = Player.order('ladder_pos desc').first
    ladder_pos = 1
    if(lastLadderPlayer)
    	ladder_pos = lastLadderPlayer.ladder_pos + 1
    end
    
    @player.ladder_pos = ladder_pos

    respond_to do |format|
      if @player.save
        format.html { redirect_to '/games/new', notice: 'Player was successfully created.' }
        format.json { render json: @player, status: :created, location: @player }
      else
        format.html { render action: "new" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.json
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /players
  # PUT /players
  def update_multiple

    Player.update(params[:player].keys, params[:player].values)
    flash[:notice] = 'Players successfully updated'
    redirect_to :action => "list"

  end


  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end
  
end
