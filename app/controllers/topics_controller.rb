class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update]

  def index
    @topics = Topic.all.includes(:interests).sort_by {|topic| topic.interests.sum(:level)}
    end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true, filter_html: true, no_links: true)
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :description, :focus_area)
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end
end
