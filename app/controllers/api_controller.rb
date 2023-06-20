class ApiController < ApplicationController
  def index
    @response = Article.all
    render json: @response
  end
end
