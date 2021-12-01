class PacksController < ApplicationController
  def index
	  @packs = Pack.published
  end

  def show
	  @pack = Pack.find(params[:id])
  end
end
