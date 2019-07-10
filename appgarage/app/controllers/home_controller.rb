class HomeController < ApplicationController

  # GET /
  def index
    OpenTracing.start_active_span('home') do
      @most_downloaded = App.order(downloads: :desc).limit(5)
      @highest_rated = App.order(rating: :desc).limit(5)
    end
  end
end