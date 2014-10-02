class StoriesController < ApplicationController
  include VotableControllerMixin

  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_story, only: [:edit, :update, :destroy]

  def index
    @stories = Story.all.includes(:user)
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def edit
  end

  def create
    @story = Story.new(story_params)
    @story.user = current_user

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def downvote
    @story = Story.find(params[:id])
    submit_downvote(@story, current_user)
    redirect_to @story
  end

  def upvote
    @story = Story.find(params[:id])
    submit_upvote(@story, current_user)
    redirect_to @story
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_story
    @story = current_user.stories.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def story_params
    params.require(:story).permit(:text, :title)
  end
end
