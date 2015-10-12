class TopicsController < ApplicationController
  # before_action :authenticate_user!
  def index
      @topics = Topic.all
    end

  def new
  end

  def create
    @topic = Topic.create(params[:topic])

    redirect_to @topic
  end

  def show
      @topic = Topic.find(params[:id])
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :description, :focus_area)
    end
end
