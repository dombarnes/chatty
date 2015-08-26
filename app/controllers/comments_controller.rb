class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]

  before_filter :load_parent

  def new
    @comment = Comment.new(name: cookies[:commenter_name])
    @comment = @room.comments.new
  end

  def create
    @comment = @room.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        flash[:notice] = "Comment posted!"
        cookies[:commenter_name] = @comment.name
        format.html { redirect_to @room, notice: 'Comment added.' }
        format.json { redirect_to @room } #, status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = @room.comments.find(comment_params)
    @comment.destroy
    respond_to
      format.html { redirect_to room_comments_path(@room) }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment, :name, :room_id)
    end

    def find_commentable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end

    def load_parent
      @room = Room.find(params[:room_id])
    end
end
