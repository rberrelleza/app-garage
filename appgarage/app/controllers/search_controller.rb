class SearchController < ApplicationController

  def index
    OpenTracing.start_active_span('search') do
      @apps = App.where("name LIKE ?", "%#{params[:query]}%")
    end
  end
end