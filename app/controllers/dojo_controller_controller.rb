class DojoControllerController < ApplicationController
  def index
    @dojo_controller = Dojo.all
    render "index"
  end
end
