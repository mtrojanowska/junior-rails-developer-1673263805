class HomeController < ApplicationController
  skip_before_action :authenticate_author!, only: [:index]
  def index; end
end
