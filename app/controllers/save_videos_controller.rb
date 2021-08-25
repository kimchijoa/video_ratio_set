class SaveVideosController < ApplicationController
  before_action :set_save_video, only: %i[ show edit update destroy ]

  # GET /save_videos or /save_videos.json
  def index
    @save_videos = SaveVideo.all
  end

  # GET /save_videos/1 or /save_videos/1.json
  def show
  end

  # GET /save_videos/new
  def new
    @save_video = SaveVideo.new
  end

  # GET /save_videos/1/edit
  def edit
  end

  # POST /save_videos or /save_videos.json
  def create
    @save_video = SaveVideo.new(save_video_params)

    respond_to do |format|
      if @save_video.save
        format.html { redirect_to @save_video, notice: "Save video was successfully created." }
        format.json { render :show, status: :created, location: @save_video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @save_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /save_videos/1 or /save_videos/1.json
  def update
    respond_to do |format|
      if @save_video.update(save_video_params)
        format.html { redirect_to @save_video, notice: "Save video was successfully updated." }
        format.json { render :show, status: :ok, location: @save_video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @save_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /save_videos/1 or /save_videos/1.json
  def destroy
    @save_video.destroy
    respond_to do |format|
      format.html { redirect_to save_videos_url, notice: "Save video was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_save_video
      @save_video = SaveVideo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def save_video_params
      params.require(:save_video).permit(:string)
    end
end
