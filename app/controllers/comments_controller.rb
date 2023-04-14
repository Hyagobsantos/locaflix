class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  def index
    @comments = current_user.comments
  end

  def show
  end

  def edit
    @movie_id = Movie.find(@comment.movie_id).id
  end

  def new
    @comment = Comment.new
    @select = params[:movie_id]
  end

  def create
    @comment = Comment.new(comment_params)
    @movie_comment = set_movie_id @comment.movie_id
    @comment.user = current_user

    respond_to do |format|
      if @movie_comment.present?
        format.html { redirect_to comments_url(@comment), alert: "Comentário Já Cadastrado Para esse filme" }
      else
        if @comment.save
          format.html { redirect_to comment_url(@comment), notice: "Comentário criado com sucesso" }
          format.json { render :show, status: :created, location: @comment }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comentário Foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: "comentário excluido com sucesso." }
      format.json { head :no_content }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:note, :opinion, :watched, :movie_id)
  end
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_movie_id id
    Comment.where("movie_id == ?", id)
  end

end
