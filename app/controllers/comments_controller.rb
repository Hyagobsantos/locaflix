class CommentsController < ApplicationController
  before_action :set_comment, only: [:show]
  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
    @select = params[:movie_id]
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to comment_url(@comment), notice: "Comentário criado com sucesso" }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:note, :opinion, :watched, :movie_id)
  end
  def set_comment
    @comment = Comment.find(params[:id])
    @movie_title = Movie.find(@comment.movie_id)
  end
end
