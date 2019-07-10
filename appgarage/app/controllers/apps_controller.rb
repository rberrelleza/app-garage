class AppsController < ApplicationController
  before_action :set_app, only: [:show]

  # GET /apps
  # GET /apps.json
  def index
    OpenTracing.start_active_span('apps_index') do
      @apps = App.all
    end
  end

  # GET /apps/1
  # GET /apps/1.json
  def show
    OpenTracing.start_active_span('apps_show') do 
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      OpenTracing.start_active_span('find') do
        @app = App.find(params[:id])
      end
    end

end
