class PacksController < ApplicationController
  def index
	  @packs = Pack.all
  end

  def show
  end
end
