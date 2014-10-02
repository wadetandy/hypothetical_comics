class CommentsController < ApplicationController
  include VotableControllerMixin

  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @story, notice: 'Comment was created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to @story, warning: 'There was a problem.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @comment.story, notice: 'Comment was deleted.' }
      format.json { head :no_content }
    end
  end

  def downvote
    @comment = Comment.find(params[:id])
    submit_downvote(@comment, current_user)
    redirect_to @comment.story
  end

  def upvote
    @comment = Comment.find(params[:id])
    submit_upvote(@comment, current_user)
    redirect_to @comment.story
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:text)
  end
end
