class DownloadsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_download, only: %i[ show ]

  # GET /downloads or /downloads.json
  def index
    @downloads = Download.all
    render json: @downloads
  end

  def total_downloads
    @total_downloads = Download.count
    render json: { total_downloads: @total_downloads }
  end

  # GET /downloads/1 or /downloads/1.json
  def show
  end

  # GET /downloads/new
  def new
    @download = Download.new
  end

  # GET /downloads/1/edit
  def edit
  end

  # POST /downloads or /downloads.json
  def create
    @download = Download.new(download_params)

    respond_to do |format|
      if @download.save
        format.json { render :show, status: :created, location: @download }
      else
        format.json { render json: @download.errors, status: :unprocessable_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_download
      @download = Download.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def download_params
      params.expect(download: [ :download ])
    end
end
