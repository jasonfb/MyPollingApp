class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
    if Time.current - @request.created_at > @request.random_seconds
      @request.finish!
    end

    respond_to do |format|
      format.json {render json: {
          status: @request.finished_at ?   "finished" : "pending",
          row_html: render_html_content(partial: "requests/line", layout: false, locals: {request: @request})
        }
      }
    end
  end

  def create
    @request = Request.create!(random_seconds: (4 + rand(5))) #random integer between 4 and 9
    respond_to do |format|
      format.js
    end
  end
end
