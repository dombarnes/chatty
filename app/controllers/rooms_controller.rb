class RoomsController < ApplicationController
  # include Tokenable
  before_action :set_room, only: [:show, :edit, :update, :destroy, :search]

  def index
    if params[:search]
      @rooms = Room.search(params[:search]).order("created_at DESC")
    else
      @rooms = Room.all.order('created_at DESC')
    end
  end

  def show
    # @room = Room.find(params[:room_params])
    @new_comment = Comment.new
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Welcome to your new room.' }
        format.json { render action: 'show', status: :created, location: @room }
      else
        format.html { render action: 'new' }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url }
      format.json { head :no_content }
    end
  end

  def add
    @comment = Room.find(params[:id]).comments.create(params[:comment])
    redirect_to :action => 'show'
  end

  def comment
   Room.find(params[:id]).comments.create(params[:comment])
   flash[:notice] = "Added your comment"
   redirect_to :action => "show", :id => params[:id]
  end

  def search
    # @room = Room.find_by_uid(params[:query])
    redirect_to :action => 'show', :uid => params[:uid]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find_by_uid(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:title, :uid)
    end
end
